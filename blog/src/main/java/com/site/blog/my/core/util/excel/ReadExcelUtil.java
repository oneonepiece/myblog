package com.site.blog.my.core.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
public class ReadExcelUtil{

    /**
     * excel导出数据
     * @param file （excel文件路径）
     *
     */
    public static HSSFWorkbook readExcel(File file) throws IOException {

        FileInputStream fileInputStream = null;
        HSSFWorkbook hssfWorkbook = null;
        try {
            fileInputStream = new FileInputStream(file);
            hssfWorkbook = new HSSFWorkbook(fileInputStream);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (fileInputStream != null)fileInputStream.close();
        }
        return hssfWorkbook;
    }

    /*
     *LinkedHashMap结构，<类属性名（对应列的值）,字符串类型>
     *      Integer
     *      String
     *      Date
     *      Double
     */
    public static List<LinkedHashMap<String, Object>> excelMap(LinkedHashMap<String ,Object> map , File file ) throws IOException {

        List<LinkedHashMap<String,Object>> list;
        list = new ArrayList<>();

        HSSFWorkbook hssfWorkbook = readExcel(file);
        //XSSFSheet spreadsheet = workbook.getSheetAt(0);
        HSSFSheet spreadsheet = hssfWorkbook.getSheetAt(0);

        // 3、 读取sheet中每一行
        for (Row row : spreadsheet) {
            // 一行数据 对应 一个区域对象
            if (row.getRowNum() == 0) {
                // 第一行 跳过
                continue;
            }
            //一行数据
            LinkedHashMap<String,Object> linkedHashMap = new LinkedHashMap(map.size()*2);
            int i=0;
            for (Iterator it =  map.keySet().iterator();it.hasNext();)
            {
                String key = (String)it.next();
                Object obtype = map.get(key);
                if (obtype.equals(Integer.class)){
                    //空行时赋值为1010101010
                    Double  d = 1010101010.0;
                    if (row.getCell(i) != null){
                        d = row.getCell(i).getNumericCellValue();
                    }
                    linkedHashMap.put(key , d.intValue());

                }else if (obtype.equals(String.class)){
                    //避免为空
                    String s = "null";
                    if (row.getCell(i) != null){
                        s = row.getCell(i).getStringCellValue();
                    }
                    linkedHashMap.put(key , s);

                }else if (obtype.equals(Date.class)){
                    Date date = null;
                    if (row.getCell(i) != null){
                        date = row.getCell(i).getDateCellValue();
                    }
                    linkedHashMap.put(key , date);
                }else if (obtype.equals(Double.class)){
                    //空行时赋值为101010.010101
                    Double  d = 101010.010101;
                    if (row.getCell(i) != null){
                        d = row.getCell(i).getNumericCellValue();
                    }
                    linkedHashMap.put(key , d);
                }
                i++;

            }
            if (linkedHashMap != null) {
                list.add(linkedHashMap);
            }
        }
        return list;
    }

}
