<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="header.jsp" %>
	
	<section id="page_app_form" class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form action="result.jsp" method="get" autocomplete="on">
					<div class="form-group">
						<label for="query">Pencarian Twitter</label>
						<input name="query" type="text" class="form-control" placeholder="#lalinBDG" value="#lalinBDG">
					</div>
					<div class="form-group">
						<label for="macet"><i>Keyword</i> lalu lintas macet</label>
						<input name="macet" type="text" class="form-control" placeholder="macet, padat, ramai, merayap" value="macet, padat, ramai, merayap">
					</div>
					<div class="form-group">
						<label for="lancar"><i>Keyword</i> lalu lintas lancar</label>
						<input name="lancar" type="text" class="form-control" placeholder="lancar, sepi, kosong" value="lancar, sepi, kosong">
					</div>
					<div class="form-group">
						<label for="kasus"><i>Keyword</i> kasus lalu lintas</label>
						<input name="kasus" type="text" class="form-control" placeholder="tabrak, nabrak, kecelakaan, perbaikan, banjir" value="tabrak, nabrak, kecelakaan, perbaikan, banjir">
					</div>
					<div class="form-group">
						<label for="algoritma">Algoritma pencarian string</label>
						<div class="radio">
							<label><input type="radio" name="algoritma" value="javadefault" checked> <code>indexOf()</code> bawaan Java</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="algoritma" value="kmp"> Knuth-Morris-Pratt</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="algoritma" value="boyermoore"> Boyer-Moore</label>
						</div>
					</div>
					<div class="form-group">
						<label for="source">Sumber data</label>
						<p class="help-block">Sumber data yang digunakan untuk analisis dapat menggunakan data <i>tweets</i> terakhir yang diambil menggunakan <a href="https://twitter.com/search-home" target="_blank">Twitter Search API</a>, atau menggunakan data <i>dummy</i> untuk <i>testing</i> dan <i>debugging</i>.</p>
						<div class="radio">
							<label><input type="radio" name="source" value="twitter" checked> Data <i>tweets</i> terakhir</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="source" value="dummy"> Data <i>dummy</i></label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary btn-lg">Analisa</button>
				</form>
			</div>
		</div>
	</section>

<%@include file="footer.jsp" %>