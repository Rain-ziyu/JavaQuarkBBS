package com.quark.common;


import com.quark.common.utils.Constants;
import org.dom4j.DocumentException;

public class Test {
    @org.junit.jupiter.api.Test
    public void test() throws DocumentException {
        Constants constants = new Constants();
        constants.testXml("<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<ShareMessage xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">\r\n    <ShareId>2</ShareId>\r\n    <UserId>2</UserId>\r\n    <OperatorId>2</OperatorId>\r\n    <OperatorName>Administrator</OperatorName>\r\n    <OperatorLoginName>admin</OperatorLoginName>\r\n    <ShareName>三级文件</ShareName>\r\n    <ShareTime>2022-02-16T17:09:38.502727+08:00</ShareTime>\r\n    <ShareBeginTime>2022-02-16T17:09:38.502727+08:00</ShareBeginTime>\r\n    <ShareEndTime>2022-02-20T23:59:59</ShareEndTime>\r\n    <SharePermission>1</SharePermission>\r\n    <ShareMessageDocList>\r\n        <ShareMessageDoc>\r\n            <ShareId>2</ShareId>\r\n            <EntryType>1</EntryType>\r\n            <EntryId>45</EntryId>\r\n            <EntryName>三级文件</EntryName>\r\n            <CreateOperator>Administrator</CreateOperator>\r\n            <CreateTime>2022-01-21T14:29:44.513</CreateTime>\r\n            <CurSize>1216</CurSize>\r\n            <ParentId>0</ParentId>\r\n        </ShareMessageDoc>\r\n    </ShareMessageDocList>\r\n    <ShareMessageContent>QWRtaW5pc3RyYXRvcuWFseS6q+S6huaWh+S7ti/mlofku7blpLnnu5nmgqg8YnIvPiDku44wMi8xNi8yMDIyIDE3OjA5OjM45YiwMDIvMjAvMjAyMiAyMzo1OTo1OTxici8+IOaLpeacieadg+mZkDrpooTop4gmbmJzcDsmbmJzcDs8YnIvPueVmeiogDrkuInnuqfmlofku7Y8YnIvPjxhIGhyZWY9Imh0dHA6Ly9kY2Mub3JpZW50LWNoaXAuY29tOjQ0MDAvRGVmYXVsdC5hc3B4P0VudHJ5SWQ9NDUmc2hhcmVDb2RlPTIiIHRhcmdldD0iX0JsYW5rIiA+5LiJ57qn5paH5Lu2PC9hPjxici8+</ShareMessageContent>\r\n</ShareMessage>","//ShareBeginTime");
    }
}
