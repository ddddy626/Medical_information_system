package com.dyh.doctor.domain;

public class AnnouncementEntity {
    private Integer announcementId;
    private String title;
    private String content;
    private Integer authorId;
    private String authorName;
    private String createTime;
    private Integer status;

    public Integer getAnnouncementId() { return announcementId; }
    public void setAnnouncementId(Integer announcementId) { this.announcementId = announcementId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Integer getAuthorId() { return authorId; }
    public void setAuthorId(Integer authorId) { this.authorId = authorId; }
    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }
    public String getCreateTime() { return createTime; }
    public void setCreateTime(String createTime) { this.createTime = createTime; }
    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }
}
