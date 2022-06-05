package framework.pojo;

public class Browse {
    private Integer userId;
    private Integer goodsId;
    private Integer categoryId;
    private String beginTime;
    private String endTime;
    private String time;

    public Browse(Integer userId, Integer goodsId, Integer categoryId, String beginTime, String endTime, String time) {
        this.userId = userId;
        this.goodsId = goodsId;
        this.categoryId = categoryId;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.time = time;
    }

    public Browse() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Browse{" +
                "userId=" + userId +
                ", goodsId=" + goodsId +
                ", categoryId=" + categoryId +
                ", beginTime='" + beginTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
