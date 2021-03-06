package com.utopia.gallery.persistence;

import com.utopia.gallery.model.Works;
import com.utopia.gallery.model.WorksExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WorksMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int countByExample(WorksExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int deleteByExample(WorksExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int insert(Works record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int insertSelective(Works record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    List<Works> selectByExample(WorksExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    Works selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int updateByExampleSelective(@Param("record") Works record, @Param("example") WorksExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int updateByExample(@Param("record") Works record, @Param("example") WorksExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int updateByPrimaryKeySelective(Works record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table works
     *
     * @mbggenerated Fri Mar 20 13:26:36 CST 2015
     */
    int updateByPrimaryKey(Works record);
}