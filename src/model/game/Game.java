package model.game;

public class Game {
    private int id;
    private String name;
    private String category;
    private String detail;
    private String systemRequirements;
    private double price;
    private double discount;
    private String status;
    private String downloadLink;
    private String smallImgPath;
    private String bigImg1Path;
    private String bigImg2Path;
    private String bigImg3Path;
    private String videoPath;

    public Game() {
    }

    public Game(int id, String name, String category, String detail, String systemRequirements, double price, double discount, String status, String downloadLink, String smallImgPath, String bigImg1Path, String bigImg2Path, String bigImg3Path, String videoPath) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.detail = detail;
        this.systemRequirements = systemRequirements;
        this.price = price;
        this.discount = discount;
        this.status = status;
        this.downloadLink = downloadLink;
        this.smallImgPath = smallImgPath;
        this.bigImg1Path = bigImg1Path;
        this.bigImg2Path = bigImg2Path;
        this.bigImg3Path = bigImg3Path;
        this.videoPath = videoPath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getSystemRequirements() {
        return systemRequirements;
    }

    public void setSystemRequirements(String systemRequirements) {
        this.systemRequirements = systemRequirements;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDownloadLink() {
        return downloadLink;
    }

    public void setDownloadLink(String downloadLink) {
        this.downloadLink = downloadLink;
    }

    public String getSmallImgPath() {
        return smallImgPath;
    }

    public void setSmallImgPath(String smallImgPath) {
        this.smallImgPath = smallImgPath;
    }

    public String getBigImg1Path() {
        return bigImg1Path;
    }

    public void setBigImg1Path(String bigImg1Path) {
        this.bigImg1Path = bigImg1Path;
    }

    public String getBigImg2Path() {
        return bigImg2Path;
    }

    public void setBigImg2Path(String bigImg2Path) {
        this.bigImg2Path = bigImg2Path;
    }

    public String getBigImg3Path() {
        return bigImg3Path;
    }

    public void setBigImg3Path(String bigImg3Path) {
        this.bigImg3Path = bigImg3Path;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public double getSellPrice() {
        return this.price * (100 - this.discount) /100;
    }
}
