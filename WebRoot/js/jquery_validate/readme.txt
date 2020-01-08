/*
		ajaxForm:
		
		target        返回的结果将放到这个target下
		url           如果定义了，将覆盖原form的action
		type          get和post两种方式
		dataType      返回的数据类型，可选：json、xml、script
		clearForm     true，表示成功提交后清除所有表单字段值
		resetForm     true，表示成功提交后重置所有字段
		iframe        如果设置，表示将使用iframe方式提交表单
		beforeSerialize    数据序列化前：function($form,options){}
		beforeSubmit  提交前：function(arr,$from,options){}
		success       提交成功后：function(data,statusText){}
		error         错误：function(data){alert(data.message);}
		
		
		validate:
		(1)、required:true               必输字段
		(2)、remote:"remote-valid.jsp"   使用ajax方法调用remote-valid.jsp验证输入值
		(3)、email:true                  必须输入正确格式的电子邮件
		(4)、url:true                    必须输入正确格式的网址
		(5)、date:true                   必须输入正确格式的日期，日期校验ie6出错，慎用
		(6)、dateISO:true                必须输入正确格式的日期(ISO)，例如：2009-06-23，1998/01/22 只验证格式，不验证有效性
		(7)、number:true                 必须输入合法的数字(负数，小数)
		(8)、digits:true                 必须输入整数
		(9)、creditcard:true             必须输入合法的信用卡号
		(10)、equalTo:"#password"        输入值必须和#password相同
		(11)、accept:                    输入拥有合法后缀名的字符串（上传文件的后缀）
		(12)、maxlength:5                输入长度最多是5的字符串(汉字算一个字符)
		(13)、minlength:10               输入长度最小是10的字符串(汉字算一个字符)
		(14)、rangelength:[5,10]         输入长度必须介于 5 和 10 之间的字符串")(汉字算一个字符)
		(15)、range:[5,10]               输入值必须介于 5 和 10 之间
		(16)、max:5                      输入值不能大于5
		(17)、min:10                     输入值不能小于10
		*/