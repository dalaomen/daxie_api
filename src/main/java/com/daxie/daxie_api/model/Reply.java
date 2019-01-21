package com.daxie.daxie_api.model;

import javax.persistence.*;

public class Reply {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "replyId")
    private String replyid;

    @Column(name = "userId")
    private String userid;

    @Column(name = "createTime")
    private String createtime;

    @Column(name = "likeCount")
    private Integer likecount;

    private String content;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return replyId
     */
    public String getReplyid() {
        return replyid;
    }

    /**
     * @param replyid
     */
    public void setReplyid(String replyid) {
        this.replyid = replyid;
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

    /**
     * @return likeCount
     */
    public Integer getLikecount() {
        return likecount;
    }

    /**
     * @param likecount
     */
    public void setLikecount(Integer likecount) {
        this.likecount = likecount;
    }

    /**
     * @return content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }
}