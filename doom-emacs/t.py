"""Python test"""
from bs4 import BeautifulSoup as bs
from pandas import DataFrame
import re
import pandas as pd

DataFrame()
CN = "a b"
s = f"{CN}"

def is_question(string):
    pattern = r'(.*\?.*)'
    return re.match(pattern, string=string)

questions = {
    "greet":"hi?"
}
r = is_question(questions["greet"])
pd.DataFrame()
soup = bs()
