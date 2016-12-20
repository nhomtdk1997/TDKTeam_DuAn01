package com.javaweb.model;
// Generated Dec 20, 2016 11:01:57 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Nguoidung generated by hbm2java
 */
public class Nguoidung  implements java.io.Serializable {


     private Integer idnguoidung;
     private String ho;
     private String demVaTen;
     private Boolean gioiTinh;
     private Date ngaySinh;
     private String diaChi;
     private String sdt;
     private String soCmnd;
     private int quocTich;

    public Nguoidung() {
    }

	
    public Nguoidung(String ho, String demVaTen, int quocTich) {
        this.ho = ho;
        this.demVaTen = demVaTen;
        this.quocTich = quocTich;
    }
    public Nguoidung(String ho, String demVaTen, Boolean gioiTinh, Date ngaySinh, String diaChi, String sdt, String soCmnd, int quocTich) {
       this.ho = ho;
       this.demVaTen = demVaTen;
       this.gioiTinh = gioiTinh;
       this.ngaySinh = ngaySinh;
       this.diaChi = diaChi;
       this.sdt = sdt;
       this.soCmnd = soCmnd;
       this.quocTich = quocTich;
    }
   
    public Integer getIdnguoidung() {
        return this.idnguoidung;
    }
    
    public void setIdnguoidung(Integer idnguoidung) {
        this.idnguoidung = idnguoidung;
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
    public Boolean getGioiTinh() {
        return this.gioiTinh;
    }
    
    public void setGioiTinh(Boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
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
    public int getQuocTich() {
        return this.quocTich;
    }
    
    public void setQuocTich(int quocTich) {
        this.quocTich = quocTich;
    }




}


