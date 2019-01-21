package com.ifast.generator.domain;

import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * <pre>
 * 列的属性
 * </pre>
 * <small> 2018年3月23日 | Aron</small>
 */
public class ColumnDO {
    // 列名
    private String columnName;
    // 列名类型
    private String dataType;


    // 属性名称(第一个字母大写)，如：user_name => UserName
    private String attrName;
    // 属性名称(第一个字母小写)，如：user_name => userName
    private String attrname;
    // 属性类型
    private String attrType;
    // auto_increment
    private String extra;
    // 列名备注,用在html等页面显示上
    private String comments;
    // 字典字段
    private String wBookComments;
    // 全部备注内容-- 用在bean 上
    private String allComments;
    // 字典字段备注
    private Map<String, String> wBookMap;

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getAttrname() {
        return attrname;
    }

    public void setAttrname(String attrname) {
        this.attrname = attrname;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }

    public String getAttrType() {
        return attrType;
    }

    public void setAttrType(String attrType) {
        this.attrType = attrType;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }

    @Override
    public String toString() {
        return "ColumnDO{" + "columnName='" + columnName + '\'' + ", dataType='" + dataType + '\'' + ", comments='"
                + comments + '\'' + ", attrName='" + attrName + '\'' + ", attrname='" + attrname + '\'' + ", attrType='"
                + attrType + '\'' + ", extra='" + extra + '\'' + '}';
    }


    public void setAllComments(String allComments) {
        this.allComments = allComments;
        if (StringUtils.isEmpty(allComments)) {
            return;
        }
        if (!allComments.contains(";")) {
            this.comments = allComments;
            return;
        }
        try {
            // 进行复杂处理
            String[] commentList = allComments.split(";");

            this.wBookMap = new HashMap<>();
            for (String comment : commentList) {
                if (comment.contains("*")) {
                    continue;
                } else if (comment.contains("<")) {
                    String s1 = comment.substring(1);
                    String wBookComments = s1.substring(0, s1.length() - 1);
                    String[] wBookList = wBookComments.split(",");
                    this.wBookComments = wBookComments;
                    for (String entry : wBookList) {
                        String[] split2 = entry.split("=");
                        this.wBookMap.put(split2[0], split2[1]);
                    }
                } else {
                    // html 使用的 comment
                    this.comments = comment;
                }

            }
        } catch (Exception e) {
            this.comments = allComments;
        }
    }

}
