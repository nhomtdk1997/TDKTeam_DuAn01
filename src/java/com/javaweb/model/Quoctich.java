package com.javaweb.model;
// Generated Dec 15, 2016 5:22:22 PM by Hibernate Tools 4.3.1



/**
 * Quoctich generated by hbm2java
 */
public class Quoctich  implements java.io.Serializable {


     private Integer idquoctich;
     private String quocTich;
     private String moTa;

    public Quoctich() {
    }

	
    public Quoctich(String quocTich) {
        this.quocTich = quocTich;
    }
    public Quoctich(String quocTich, String moTa) {
       this.quocTich = quocTich;
       this.moTa = moTa;
    }
   
    public Integer getIdquoctich() {
        return this.idquoctich;
    }
    
    public void setIdquoctich(Integer idquoctich) {
        this.idquoctich = idquoctich;
    }
    public String getQuocTich() {
        return this.quocTich;
    }
    
    public void setQuocTich(String quocTich) {
        this.quocTich = quocTich;
    }
    public String getMoTa() {
        return this.moTa;
    }
    
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }




}


