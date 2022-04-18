#!/bin/bash
# 地区： [1-6][1-9][0-9]{4}
# 年的前两位： (18|19|20)
# 年的后两位： [0-9]{2}
# 月份：((0[1-9])|10|11|12)
# 天数： (([0-2][1-9])|10|20|30|31)
# 三位顺序码： [0-9]{3}
# 校验码： [0-9Xx]

function check(){
    cat $1 | grep -E "^[1-6][1-9][0-9]{4}(18|19|20)[0-9]{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)[0-9]{3}[0-9Xx]$"
    cat $1 | grep -E "^[1-6][1-9][0-9]{4}[0-9]{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)[0-9]{3}$"
}
check $1
