/*
		ajaxForm:
		
		target        ���صĽ�����ŵ����target��
		url           ��������ˣ�������ԭform��action
		type          get��post���ַ�ʽ
		dataType      ���ص��������ͣ���ѡ��json��xml��script
		clearForm     true����ʾ�ɹ��ύ��������б��ֶ�ֵ
		resetForm     true����ʾ�ɹ��ύ�����������ֶ�
		iframe        ������ã���ʾ��ʹ��iframe��ʽ�ύ��
		beforeSerialize    �������л�ǰ��function($form,options){}
		beforeSubmit  �ύǰ��function(arr,$from,options){}
		success       �ύ�ɹ���function(data,statusText){}
		error         ����function(data){alert(data.message);}
		
		
		validate:
		(1)��required:true               �����ֶ�
		(2)��remote:"remote-valid.jsp"   ʹ��ajax��������remote-valid.jsp��֤����ֵ
		(3)��email:true                  ����������ȷ��ʽ�ĵ����ʼ�
		(4)��url:true                    ����������ȷ��ʽ����ַ
		(5)��date:true                   ����������ȷ��ʽ�����ڣ�����У��ie6��������
		(6)��dateISO:true                ����������ȷ��ʽ������(ISO)�����磺2009-06-23��1998/01/22 ֻ��֤��ʽ������֤��Ч��
		(7)��number:true                 ��������Ϸ�������(������С��)
		(8)��digits:true                 ������������
		(9)��creditcard:true             ��������Ϸ������ÿ���
		(10)��equalTo:"#password"        ����ֵ�����#password��ͬ
		(11)��accept:                    ����ӵ�кϷ���׺�����ַ������ϴ��ļ��ĺ�׺��
		(12)��maxlength:5                ���볤�������5���ַ���(������һ���ַ�)
		(13)��minlength:10               ���볤����С��10���ַ���(������һ���ַ�)
		(14)��rangelength:[5,10]         ���볤�ȱ������ 5 �� 10 ֮����ַ���")(������һ���ַ�)
		(15)��range:[5,10]               ����ֵ������� 5 �� 10 ֮��
		(16)��max:5                      ����ֵ���ܴ���5
		(17)��min:10                     ����ֵ����С��10
		*/