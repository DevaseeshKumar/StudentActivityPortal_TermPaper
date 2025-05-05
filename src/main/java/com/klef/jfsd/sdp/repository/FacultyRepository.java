package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Faculty;

import jakarta.transaction.Transactional;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{

   @Query("select f from Faculty f where f.email=?1 and f.password=?2")
   public Faculty checkfaclogin(String femail, String fpwd);

   // Method to update faculty status
   @Query("update Faculty f set f.status=?1 where f.id=?2")
   @Modifying // DML operation
   @Transactional // Auto commit
   public int updatefacultystatus(String status, int id);
   
   // Method to delete faculty by ID
   @Query("delete from Faculty f where f.id=?1")
   @Modifying // DML operation
   @Transactional // Auto commit
   public int deletefacultybyid(int id);
}
