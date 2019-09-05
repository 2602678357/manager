package com.dao;

import com.entity.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StudentMapper {

    @Select("SELECT * FROM student s,teacher t,course c,score sc WHERE s.sid=sc.sid AND t.tid=c.tid AND c.cid=sc.cid")
    List<Info> getALL();

    @Select("SELECT * FROM teacher")
    List<teacher> getALLTeacher();

    @Select("SELECT * FROM student")
    List<student> getAllStudent();

    @Select("SELECT * FROM course")
    List<course> getAllCourse();

    @Select("SELECT * FROM teacher WHERE tid=#{tid}")
    teacher getTeacher(Integer tid);

    @Delete(" DELETE FROM student WHERE sid = #{sid}")
    void deleteStudent(Integer sid);

    @Delete("DELETE FROM teacher WHERE tid =#{tid}")
    void deleteTeacher(Integer tid);

    @Delete("DELETE FROM course WHERE course.cid=#{cid}")
    void deleteCourse(Integer cid);

    @Insert("INSERT INTO student(sname,ssex,sage) VALUES(#{sname},#{ssex},#{sage})")
    void insertStudent(student student);

    @Select("SELECT * FROM student s,teacher t,course c,score sc WHERE s.sid=sc.sid \n" +
            "AND t.tid=c.tid AND c.cid=sc.cid AND s.sid=#{sid}")
    Info getInfo(Integer sid);

    @Update("UPDATE student s SET s.sname=#{sname},s.sage=#{sage},s.ssex=#{ssex}WHERE s.sid=#{sid}")
    void updateStudent(student student);

    @Update("UPDATE teacher t SET t.tname=#{tname}WHERE t.tid=#{tid}")
    void updateTeacher(teacher teacher);

    @Update("UPDATE course SET course.cname=#{cname} WHERE course.cid=#{cid} AND course.tid=#{tid}")
    void updateCourse(course course);

    @Update("UPDATE score SET score.score=#{score} WHERE score.cid=#{cid} AND score.sid=#{sid}")
    void updateScore(score score);

    @Insert("INSERT INTO teacher(teacher.tname)VALUES(#{tname}) ")
    void insertTeacher(teacher teacher);
}
