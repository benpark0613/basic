<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-light navbar-light">
	<div class="container">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link ${menu eq '샘플1' ? 'active bg-danger text-white fs-bold' : '' }" href="/model2-app/jstl1.hta">sample1</a></li>
			<li class="nav-item"><a class="nav-link ${menu eq '샘플2' ? 'active bg-danger text-white fs-bold' : '' }" href="/model2-app/jstl2.hta">sample2</a></li>
			<li class="nav-item"><a class="nav-link ${menu eq '샘플3' ? 'active bg-danger text-white fs-bold' : '' }" href="/model2-app/jstl3.hta">sample3</a></li>
		</ul>
	</div>
</nav>