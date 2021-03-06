package com.javaweb.model;
// Generated Dec 20, 2016 11:01:57 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * Ve generated by hbm2java
 */
public class Ve  implements java.io.Serializable {


     private Integer idve;
     private String ho;
     private String demVaTen;
     private Date ngaySinh;
     private String diaChi;
     private String sdt;
     private String soCmnd;
     private String idquoctich;
     private int idchuyenbay;
     private Integer idtaikhoan;
     private int soNguoiLon;
     private Integer soTreEm;
     private Integer soEmBe;
     private BigDecimal giaVe;

    public Ve() {
    }

	
    public Ve(String ho, String demVaTen, String sdt, String soCmnd, String idquoctich, int idchuyenbay, int soNguoiLon) {
        this.ho = ho;
        this.demVaTen = demVaTen;
        this.sdt = sdt;
        this.soCmnd = soCmnd;
        this.idquoctich = idquoctich;
        this.idchuyenbay = idchuyenbay;
        this.soNguoiLon = soNguoiLon;
    }
    public Ve(String ho, String demVaTen, Date ngaySinh, String diaChi, String sdt, String soCmnd, String idquoctich, int idchuyenbay, Integer idtaikhoan, int soNguoiLon, Integer soTreEm, Integer soEmBe, BigDecimal giaVe) {
       this.ho = ho;
       this.demVaTen = demVaTen;
       this.ngaySinh = ngaySinh;
       this.diaChi = diaChi;
       this.sdt = sdt;
       this.soCmnd = soCmnd;
       this.idquoctich = idquoctich;
       this.idchuyenbay = idchuyenbay;
       this.idtaikhoan = idtaikhoan;
       this.soNguoiLon = soNguoiLon;
       this.soTreEm = soTreEm;
       this.soEmBe = soEmBe;
       this.giaVe = giaVe;
    }
   
    public Integer getIdve() {
        return this.idve;
    }
    
    public void setIdve(Integer idve) {
        this.idve = idve;
    }
    public String getHo() {
        return this.ho;
    }
    
    public void setHo(String ho) {
        this.ho = ho;
    }
    public String getDemVaTen() {
        return this.demVaTen;
    }
    
    public void setDemVaTen(String demVaTen) {
        this.demVaTen = demVaTen;
    }
    public Date getNgaySinh() {
        return this.ngaySinh;
    }
    
    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public String getSdt() {
        return this.sdt;
    }
    
    public void setSdt(String sdt) {
        this.sdt = sdt;
    }
    public String getSoCmnd() {
        return this.soCmnd;
    }
    
    public void setSoCmnd(String soCmnd) {
        this.soCmnd = soCmnd;
    }
    public String getIdquoctich() {
        return this.idquoctich;
    }
    
    public void setIdquoctich(String idquoctich) {
        this.idquoctich = idquoctich;
    }
    public int getIdchuyenbay() {
        return this.idchuyenbay;
    }
    
    public void setIdchuyenbay(int idchuyenbay) {
        this.idchuyenbay = idchuyenbay;
    }
    public Integer getIdtaikhoan() {
        return this.idtaikhoan;
    }
    
    public void setIdtaikhoan(Integer idtaikhoan) {
        this.idtaikhoan = idtaikhoan;
    }
    public int getSoNguoiLon() {
        return this.soNguoiLon;
    }
    
    public void setSoNguoiLon(int soNguoiLon) {
        this.soNguoiLon = soNguoiLon;
    }
    public Integer getSoTreEm() {
        return this.soTreEm;
    }
    
    public void setSoTreEm(Integer soTreEm) {
        this.soTreEm = soTreEm;
    }
    public Integer getSoEmBe() {
        return this.soEmBe;
    }
    
    public void setSoEmBe(Integer soEmBe) {
        this.soEmBe = soEmBe;
    }
    public BigDecimal getGiaVe() {
        return this.giaVe;
    }
    
    public void setGiaVe(BigDecimal giaVe) {
        this.giaVe = giaVe;
    }




}


