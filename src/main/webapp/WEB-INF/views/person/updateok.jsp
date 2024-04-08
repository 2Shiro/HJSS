<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
  alert('수정 ok')
	window.opener.document.location.replace("/Company/GetProposal");
	window.opener.parent.location.reload();
	window.close();
 
</script>