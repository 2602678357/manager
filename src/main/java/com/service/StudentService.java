package com.service;

import com.dao.StudentMapper;
import com.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;


    /**
     * 得到学生映射集合
     * @return
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Info> getAll(){ return studentMapper.getALL(); }
    /**
     * 得到老师信息集合
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<teacher> getAllTeacher(){
        return studentMapper.getALLTeacher();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<course> getAllCourse2(){
        return studentMapper.getAllCourse(); }
    /**
     * 得到课程集合
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<course> getAllCourse(){
        return studentMapper.getAllCourse();
    };
    /**
     * 得到学生信息集合
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<student> getAllStudent(){
        return studentMapper.getAllStudent();
    }
    /**
     * 删除学生
     * @param sid
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void deleteStudent(Integer sid){
        studentMapper.deleteStudent(sid);
    }

    /**
     * 删除老师
     * @param tid
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void deleteTeacher(Integer tid){
        studentMapper.deleteTeacher(tid);
    }

    /**
     * 删除课程
     * @param cid
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void deleteCourse(Integer cid){
        studentMapper.deleteCourse(cid);
    }
    /**
     * 插入学生
     * @param student
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void insertStudent(student student){
        studentMapper.insertStudent(student);
    }

    /**
     * 插入教师
     * @param teacher
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void insertTeacher(teacher teacher){
        studentMapper.insertTeacher(teacher);
    }

    /**
     * 根据Id获取所有信息
     * @param sid
     * @return
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public Info getInfo(Integer sid){
        return studentMapper.getInfo(sid);
    }

    public teacher getTeacher(Integer tid){
        return studentMapper.getTeacher(tid);
    }
    /**
     * 更新学生
     * @param student
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void updateStudent(student student){
        studentMapper.updateStudent(student);
    }

    /**
     * 更新教师
     * @param teacher
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void updateTeacher(teacher teacher){
        studentMapper.updateTeacher(teacher);
    }

    /**
     * 更新课程
     * @param course
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void updateCourse(course course){
        studentMapper.updateCourse(course);
    }

    /**
     * 更新分数
     * @param score
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    public void updateScore(score score){
        studentMapper.updateScore(score);
    }

}
