package com.daxie.daxie_api.model;

import javax.persistence.*;

public class Comments {
    @Id
    @Column(name = "commentId")
    private Integer commentid;

    private String comment;

    @Column(name = "userId")
    private String userid;

    @Column(name = "forId")
    private String forid;

    @Column(name = "createTime")
    private String createtime;

    /**
     * @return commentId
     */
    public Integer getCommentid() {
        return commentid;
    }

    /**
     * @param commentid
     */
    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    /**
     * @return comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return userId
     */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * @return forId
     */
    public String getForid() {
        return forid;
    }

    /**
     * @param forid
     */
    public void setForid(String forid) {
        this.forid = forid;
    }

    /**
     * @return createTime
     */
    public String getCreatetime() {
        return createtime;
    }

    /**
     * @param createtime
     */
    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
}
