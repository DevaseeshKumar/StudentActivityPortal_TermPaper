package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="faculty_table")
public class Faculty 
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY) 
   @Column(name="faculty_id")
   private int id;
   
   @Column(name="faculty_name", nullable=false, length=50)
   private String name;
   
   @Column(name="faculty_password", nullable=false, length=50)
   private String password;
   
   @Column(name="faculty_email", nullable=false, unique=true, length=50)
   private String email;
   
   @Column(name="faculty_department", nullable=false, length=50)
   private String department;
   
   @Column(name="faculty_contactno", nullable=false, unique=true, length=20)
   private String contactno;
   
   @Column(name="faculty_status", nullable=false, length=50)
   private String status;
   
   @Column(name="faculty_location", nullable=false, length=50)
   private String location;
   
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
   public String getPassword() {
     return password;
   }
   public void setPassword(String password) {
     this.password = password;
   }
   public String getEmail() {
     return email;
   }
   public void setEmail(String email) {
     this.email = email;
   }
   public String getDepartment() {
     return department;
   }
   public void setDepartment(String department) {
     this.department = department;
   }
   public String getContactno() {
     return contactno;
   }
   public void setContactno(String contactno) {
     this.contactno = contactno;
   }
   public String getStatus() {
     return status;
   }
   public void setStatus(String status) {
     this.status = status;
   }
   public String getLocation() {
     return location;
   }
   public void setLocation(String location) {
     this.location = location;
   }
}
