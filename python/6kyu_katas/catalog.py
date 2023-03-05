# https://www.codewars.com/kata/59d9d8cb27ee005972000045/train/python
import re
s = """<prod><name>drill</name><prx>99</prx><qty>5</qty></prod>

<prod><name>hammer</name><prx>10</prx><qty>50</qty></prod>

<prod><name>screwdriver</name><prx>5</prx><qty>51</qty></prod>

<prod><name>table saw</name><prx>1099.99</prx><qty>5</qty></prod>

<prod><name>saw</name><prx>9</prx><qty>10</qty></prod>

<prod><name>chair</name><prx>100</prx><qty>20</qty></prod>

<prod><name>fan</name><prx>50</prx><qty>8</qty></prod>

<prod><name>wire</name><prx>10.8</prx><qty>15</qty></prod>

<prod><name>battery</name><prx>150</prx><qty>12</qty></prod>

<prod><name>pallet</name><prx>10</prx><qty>50</qty></prod>

<prod><name>wheel</name><prx>8.80</prx><qty>32</qty></prod>

<prod><name>extractor</name><prx>105</prx><qty>17</qty></prod>

<prod><name>bumper</name><prx>150</prx><qty>3</qty></prod>

<prod><name>ladder</name><prx>112</prx><qty>12</qty></prod>

<prod><name>hoist</name><prx>13.80</prx><qty>32</qty></prod>

<prod><name>platform</name><prx>65</prx><qty>21</qty></prod>

<prod><name>car wheel</name><prx>505</prx><qty>7</qty></prod>

<prod><name>bicycle wheel</name><prx>150</prx><qty>11</qty></prod>

<prod><name>big hammer</name><prx>18</prx><qty>12</qty></prod>

<prod><name>saw for metal</name><prx>13.80</prx><qty>32</qty></prod>

<prod><name>wood pallet</name><prx>65</prx><qty>21</qty></prod>

<prod><name>circular fan</name><prx>80</prx><qty>8</qty></prod>

<prod><name>exhaust fan</name><prx>62</prx><qty>8</qty></prod>

<prod><name>window fan</name><prx>62</prx><qty>8</qty></prod>"""
import re
def catalog(s, article):
    # Scan all the text 
    pattern = re.compile(rf"""(
        <name>([a-z, ]*\b{re.escape(article)}\b[a-z, ]*)</name>    # Get exact name - needed here re.escape because of ' ' in longer strings like 'big hammer'
        <prx>([0-9\.]+)</prx>                                      # Get price
        <qty>([0-9\.]+)</qty>                                      # Get quantity
    )""", re.VERBOSE)
    catalogs = re.findall(pattern, s)
    if len(catalogs) > 0:
        catalogsAsString = f'{catalogs[0][1]} > prx: ${catalogs[0][2]} qty: {catalogs[0][3]}'
        for catalog in catalogs[1:]:
           catalogsAsString += f'{catalog[1]} > prx: ${catalog[2]} qty: {catalog[3]}\r\n'
        return catalogsAsString
    else:
        return "Nothing"
print(catalog(s, "fan"))