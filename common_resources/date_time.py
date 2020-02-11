# from __future__ import absolute_import
import time
from datetime import datetime

import re
class date_time:
    def __init__(self):
        ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def convert_to_standard_time(self):
        localtime = time.localtime()
        formatted_time = time.strftime("%H:%M:%S", localtime)
        return formatted_time

    def convert_into_military_time(self, m2):
        # from datetime import datetime
        # m2 = '1:35 PM'
        in_time = datetime.strptime(m2, "%I:%M %p")
        out_time = datetime.strftime(in_time, "%H:%M")
        return out_time
        # 13: 35

    def convert_into_standard_time(self, m2):
        # from datetime import datetime
        # m2 = '1:35 PM'
        in_time = datetime.strptime(m2, "%H:%M")
        out_time = datetime.strftime(in_time, "%I:%M %p")
        return out_time
