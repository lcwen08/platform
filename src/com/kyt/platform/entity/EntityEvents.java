package com.kyt.platform.entity;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.ofbiz.base.location.ComponentLocationResolver;

import com.kyt.xsd.fieldtypemodel.FieldTypeDefDocument.FieldTypeDef;
import com.kyt.xsd.fieldtypemodel.FieldtypemodelDocument;

/**
 * 
 * @author lcwen
 * 
 */
public class EntityEvents {

	/**
	 * 下载实体xml
	 */
	public static String downloadEntityXml(HttpServletRequest request,
			HttpServletResponse response) {
		String xmlName = request.getParameter("xmlName");
		response.setContentType("text/xml");
		try {
			OutputStream out = response.getOutputStream();
			URL url = new ComponentLocationResolver()
					.resolveLocation("component://platform/entitydef/"
							+ xmlName + ".xml");
			InputStream in = new FileInputStream(new File(url.getPath()));
			IOUtils.copy(in, out);
			out.flush();
			out.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	/**
	 * 上传实体xml
	 */
	public static String uploadEntityXml(HttpServletRequest request,
			HttpServletResponse response) {
		String xmlName = request.getParameter("xmlName");
		String xmlContent = request.getParameter("xmlContent");
		try {
			URL url = new ComponentLocationResolver()
					.resolveLocation("component://platform/entitydef/"
							+ xmlName + ".xml");
			FileUtils.writeStringToFile(new File(url.getPath()), xmlContent);
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	/**
	 * 获取字段类型
	 */
	public static String getFieldTypes(HttpServletRequest request,
			HttpServletResponse response) {
		String dbType = request.getParameter("dbType");
		if(dbType == null) {
			dbType = "mysql";
		} else {
			dbType = dbType.toLowerCase();
		}
		try {
			URL url = new ComponentLocationResolver()
					.resolveLocation("component://entity/fieldtype/fieldtype"
							+ dbType + ".xml");
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			FieldtypemodelDocument doc = FieldtypemodelDocument.Factory.parse(url);
			List<Map<String, String>> list = new ArrayList<Map<String,String>>();
			Map<String, String> map = null;
			for(FieldTypeDef ftd : doc.getFieldtypemodel().getFieldTypeDefArray()) {
				map = new HashMap<String, String>();
				map.put("id", ftd.getType());
				map.put("text", ftd.getType() + " " + ftd.getSqlType());
				list.add(map);
			}
			Writer writer = response.getWriter();
			JSONSerializer.toJSON(list).write(writer);
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
}
