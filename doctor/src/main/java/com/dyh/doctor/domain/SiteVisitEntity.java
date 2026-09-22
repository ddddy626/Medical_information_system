package com.dyh.doctor.domain;

public class SiteVisitEntity {
    private Integer id;
    private String visitTime;
    private String visitUrl;
    private String visitorIp;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getVisitTime() { return visitTime; }
    public void setVisitTime(String visitTime) { this.visitTime = visitTime; }
    public String getVisitUrl() { return visitUrl; }
    public void setVisitUrl(String visitUrl) { this.visitUrl = visitUrl; }
    public String getVisitorIp() { return visitorIp; }
    public void setVisitorIp(String visitorIp) { this.visitorIp = visitorIp; }
}
