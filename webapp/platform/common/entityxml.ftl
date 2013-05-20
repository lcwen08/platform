<div>
	<div id="entityCtrl">
		<table id="dg1" title="${uiLabelMap.managerentity!}" class="easyui-datagrid" style="width:auto;height:250px" url="" toolbar="#toolbar"
			rownumbers="true" fitColumns="true" singleSelect="true" data-options="onClickRow:onClickEntity">
			<thead>
				<tr>
					<th field="entityname" width="50" align="center">${uiLabelMap.entityzh!}</th>
                    <th field="entitytitle" width="75" align="center">${uiLabelMap.describe!}</th>
                    <th field="entitypackage" width="75" align="center">${uiLabelMap.packagezh!}</th>
                    <th field="entityindex" hidden="true"></th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newEntity()">${uiLabelMap.createNew!}</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editEntity()">${uiLabelMap.editors!}</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyEntity()">${uiLabelMap.deletes!}</a>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true" buttons="#dlg-buttons">  
			<div class="ftitle">${uiLabelMap.managerentity!}</div>
			<div class="fitem">
				<label>${uiLabelMap.entityzh!}:</label>
				<input id="new-entity-name" class="easyui-validatebox" required="true">
				<input id="new-entity-hidden" type="hidden"/>
			</div>
			<div class="fitem">
				<label>${uiLabelMap.describe!}:</label>
				<input id="new-entity-title">
			</div>
			<div class="fitem">
				<label>${uiLabelMap.packagezh!}:</label>
				<input id="new-entity-package">
			</div>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveEntity()">${uiLabelMap.save!}</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">${uiLabelMap.quxiao!}</a> 
		</div>
	</div>
	<br /><br />
	<div id="attribute">
		<table id="dg" class="easyui-datagrid" title="${uiLabelMap.managerAttribute!}" style="width:auto;height:250px"
			data-options="iconCls:'icon-edit',singleSelect:true,toolbar:'#tb',url:'',onClickRow: onClickRow">
			<thead>
				<tr>
	                <th data-options="field:'fieldname',width:100,align:'center',editor:{type:'text',required:true}">${uiLabelMap.fieldName!}</th>
	                <th data-options="field:'fielddis',width:100,align:'center',editor:'text'">${uiLabelMap.describe!}</th>
	                <th data-options="field:'fieldtype',width:140,align:'center',formatter:function(value,row){return value;},editor:{type:'combobox',options:{valueField:'id',textField:'text',data:_typejson,required:true}}">${uiLabelMap.type!}</th>
					<th data-options="field:'fieldnotnull',width:100,align:'center',editor:{type:'checkbox',options:{on:'true',off:'false'}}">${uiLabelMap.isnull!}</th>
					<th data-options="field:'primkey',width:100,align:'center',editor:{type:'checkbox',options:{on:'true',off:'false'}}">${uiLabelMap.primary!}</th>
					<th data-options="field:'fieldindex',hidden:true"></th>
					<th data-options="field:'fieldoldname',hidden:true"></th>
				</tr>
			</thead>
		</table>
	    <div id="tb" style="height:auto">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="newField()">${uiLabelMap.createNew!}</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeField()">${uiLabelMap.deletes!}</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="acceptField()">${uiLabelMap.save!}</a>
	        <#-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="rejectField()">${uiLabelMap.back!}</a>-->
	    </div>
	</div>
	<br /><br />
	<div id="pkattribute">
		<table id="fks" class="easyui-datagrid" title="${uiLabelMap.managerguanxi!}" style="width:auto;height:250px"  
			data-options="iconCls:'icon-edit',singleSelect:true,toolbar:'#tb1',url:'',onClickRow: onClickRows">
			<thead>
				<tr>
					<th data-options="field:'fkname',width:100,align:'center',editor:{type:'text',options:{required: true}}">${uiLabelMap.fkName!}</th>
	                <th data-options="field:'entityfield',width:100,align:'center',editor:{type:'text',options:{required: true}}">${uiLabelMap.primaryKey!}</th>
	                <th data-options="field:'relentity',width:140,align:'center',formatter:function(value,row){return value;},editor:{type:'combobox',options:{valueField:'id',textField:'text',data:relentity_json,required:true}}">${uiLabelMap.Associative!}</th>
					<th data-options="field:'relentityfield',width:140,align:'center',editor:'text'">${uiLabelMap.fk!}</th>
					<th data-options="field:'relation',width:100,align:'center',formatter:function(value,row){return value;},editor:{type:'combobox',options:{valueField:'id',textField:'text',data:relationjson,required: true}}">${uiLabelMap.relation!}</th>
					<th data-options="field:'relationtitle',width:100,align:'center',editor:'text'">${uiLabelMap.describe!}</th>
					<th data-options="field:'relationindex',hidden:true"></th>
					<th data-options="field:'relationoldname',hidden:true"></th>
				</tr>
			</thead>
		</table>
		<div id="tb1" style="height:auto">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="newRelation()">${uiLabelMap.createNew!}</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeRelation()">${uiLabelMap.deletes!}</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="acceptRelation()">${uiLabelMap.save!}</a>
	        <#--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject1()">${uiLabelMap.back!}</a>-->
		</div>
	</div>
</div>
