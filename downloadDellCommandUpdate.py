import urllib.request
import pprint
from collections import OrderedDict
from bs4 import BeautifulSoup

def getDellCommandUpdateVersions():
    base_url = "https://www.dell.com/support/home/us/en/19/Drivers/DriversDetails?driverId=DDVDP"
    #hdr = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36'}
    request = urllib.request.Request(base_url)#, headers=hdr)
    resp = urllib.request.urlopen(request, timeout = 30)
    content = BeautifulSoup(resp.read(), 'lxml')
    links = content.find_all('a', href=True)
    other_versions = OrderedDict()
    copy_link = False
    for link in links:
        if link.has_attr('id'):
            if link['id'] == "OtherVersions":
                copy_link = True
                continue
            elif link['id'] == "SupportedSystems":
                copy_link = False
                break
        elif copy_link == True:
            link_text = link.text.strip()
            other_versions[link_text] = "www.dell.com{0}".format(link['href'])
    return other_versions

def getDCUDirectDownloadLink(page_url):
    request = urllib.request.Request('https://{0}'.format(page_url))
    response = urllib.request.urlopen(request, timeout=30)
    content = BeautifulSoup(response.read(), 'lxml')
    links = content.find_all('a', href=True)
    for link in links:
        if link.text == "Download File":
            return link['href']

    return None

dcuVersions = getDellCommandUpdateVersions()
latest_dcu = list(dcuVersions)[0]
latest_dcu_webpage = dcuVersions[latest_dcu]
print(getDCUDirectDownloadLink(latest_dcu_webpage))
