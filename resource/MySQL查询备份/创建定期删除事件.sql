CREATE EVENT e_clear_keyWord
ON SCHEDULE EVERY 1 DAY
STARTS '2022-4-11 01:00:00'
DO DELETE FROM 
quark_keyWord WHERE createTime  < subdate(now(), interval 5 day)