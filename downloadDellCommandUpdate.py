import urllib2
import pprint
from collections import OrderedDict
from bs4 import BeautifulSoup

base_url = "http://www.dell.com/support/home/us/en/19/Drivers/DriversDetails?driverId=FXD2R"

hdr = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'}
request = urllib2.Request(base_url, headers=hdr)
resp = urllib2.urlopen(request)

content = BeautifulSoup(resp.read(), 'lxml')
links = content.find_all('a', href=True)
# print links

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
        text = link.text.strip()
        other_versions[text] = "www.dell.com{0}".format(link['href'])

latest_dcu = other_versions.items()[0]
