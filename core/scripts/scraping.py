from base64 import b64decode
from bs4 import BeautifulSoup
from sys import argv
from re import search, split, sub, findall, finditer
from requests import get
from os import makedirs, system
from datetime import datetime

assert len(argv) != 1

def save_file(find, src, req, path):
    file_name = (find[-1] + "".join(x for x in src.split(find[-1])[1:])).replace("/", "-")
    directory = path + "/".join(x for x in find[:-1])
    try: 
        makedirs(directory)
    except:
        pass
    ret = get(req)
    open(directory + "/" + file_name, "w").write(ret.text)

def get_code(src, path):
    find = []
    req = ""
    what = []
    add_to_path = ""
    if not search(r'[a-z]+:\/+', src):
        if src[:2] == "//":
            what = src[2:]
            req = protocollo + src
        else:
            what = src[1:]
            req = protocollo + "//" + base + "/" + src
            add_to_path = sub(r'[a-z]+:\/+', '', protocollo + "//" + base) + "/"
    else:
        what = split(r'[a-z]+:\/+', src)[1]
        req = src
    try:
        find = findall(r'[.:\-a-zA-Z\/]*[.:a-zA-Z]*\?', what)[0].split("/")
        save_file(find, src, req, path + add_to_path)
    except:
        pass

def get_image(src, path):
    url = ""
    name_DIR = ""

    if not search(r'[a-z]+:\/+', src):
        url = f"{protocollo}"
        if src[:2] == "//":
            url += f"{src}"
            name_DIR = path + "/".join(x for x in src.split("/")[1:-1])
        else:
            url += f"//{base}{src}"
            name_DIR = path + "/" + base + "/".join(x for x in src.split("/")[:-1])
    else:
        url = src
        name_DIR = path + "/".join(x for x in src.split("/")[1:-1])

    try: 
        makedirs(name_DIR)
    except:
        pass
    system(f"wget -q {url} -P {name_DIR}")

def get_image_from_b64(value, src, path):
    data = src.replace("/", "\/").replace("+", "\+").replace(".", "\.")
    regex = r'\.((.*)){((.*))(?:\([\'"]?)(.*?)(?:[\'"]?)' + data
    file_name = search(regex, value).group().split("{")[0]

    splitted = src.split(";")
    extension = splitted[0].split("/")[1]
    
    encoded = splitted[1].split(",")[1].encode()
    try: 
        makedirs(path)
    except:
        pass
    open(path + file_name + "." + extension, "wb").write(b64decode(encoded))

URL = str(argv[1])

splitted = URL.split("/")
protocollo = splitted[0]
base = splitted[2]

name_page = split(r'[a-z]+:\/+', URL)[1].replace("/", "-")
name_DIR = "~/core/results/" + name_page + "-" + datetime.now().strftime("%d-%m-%Y-%H:%M:%S")

makedirs(name_DIR)
system(f"phantomjs getSource.js {URL} {name_DIR}/{name_page}")

response = open(f"./{name_DIR}/{name_page}.html", "r").read()
soup = BeautifulSoup(response, "lxml")

for meta in set(soup.find_all("meta")):
    if meta.attrs.get("property") == "og:image":
        src = meta.attrs.get("content")
        if src:
            get_image(src, name_DIR)

for link in set(soup.find_all("link")):
    src = link.attrs.get("href")
    if src:
        if search(r'\.jpg|\.jpeg|\.ico|\.png', src):
            get_image(src, name_DIR)
        else:
            get_code(src, f"{name_DIR}/")

for script in set(soup.find_all("script")):
    src = script.attrs.get("src")
    if src:
        get_code(src, f"{name_DIR}/")

for style in set(soup.find_all("style")):
    for match in finditer(r'url(?:\([\'"]?)(.*?)(?:[\'"]?\))', str(style)):
        src = match.group().replace("url(", "").replace(")", "")
        if "data:image" in src:
            get_image_from_b64(str(style), src, f"{name_DIR}/css-images/")
        elif search(r'\.jpg|\.jpeg|\.ico|\.png', src):
            get_image(src, name_DIR)
        else:
            get_code(src, f"{name_DIR}/")

for img in set(soup.find_all("img")):
    src = img.attrs.get("src")
    if src:
        get_image(src, name_DIR)
