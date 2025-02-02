import json
import redis
import pandas as pd
import streamlit as st
from streamlit_qrcode_scanner import qrcode_scanner

PWD = open("redis.pwd", "r").read().strip()
r = redis.Redis("redis-14781.c56.east-us.azure.redns.redis-cloud.com", 14781, password=PWD, decode_responses=True)

qr_code = qrcode_scanner()

if qr_code:
    p = r.hgetall(str(qr_code))
    df = pd.DataFrame(p.values(), index=p.keys())  # type: ignore
    st.dataframe(df)