/*******************************************************************************
* KindEditor 插入特殊字符
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence LGPL(http://www.opensource.org/licenses/lgpl-license.php)
* @version 1.0
*******************************************************************************/

KE.lang.tapetrade = '交易方式';
KE.lang.tapetype = '品牌';
KE.lang.tapesize = '尺寸';
KE.lang.tapecolor = '颜色';
KE.lang.tapeunit = '单位';
KE.lang.tapeprice = '价格';
KE.lang.tapeinvoice = '发票';

KE.plugin.tapetrade = {
	click : function(id) {
		var charTable = [
			['促销','亏本甩卖','库存甩卖','尾货甩卖'],
			['急需','十万火急','大批采购','长期采购']
		];
		var cmd = 'tapetrade';
		KE.util.selection(id);
		var table = KE.$$('table');
		table.cellPadding = 0;
		table.cellSpacing = 2;
		table.border = 0;
		table.style.margin = 0;
		table.style.padding = 0;
		table.style.borderCollapse = 'separate';
		table.style.borderSpacing = '2px';
		for (var i = 0; i < charTable.length; i++) {
			var row = table.insertRow(i);
			for (var j = 0; j < charTable[i].length; j++) {
				var cell = row.insertCell(j);
				cell.style.padding = '1px';
				cell.style.margin = 0;
				cell.style.border = '1px solid #AAAAAA';
				cell.style.fontSize = '12px';
				cell.style.cursor = 'pointer';
				cell.onmouseover = function() {this.style.borderColor = '#000000'; }
				cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
				cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
				cell.innerHTML = charTable[i][j];
			}
		}
		var menu = new KE.menu({
			id : id,
			cmd : cmd
		});
		menu.append(table);
		menu.show();
	},
	exec : function(id, value) {
		KE.util.select(id);
		KE.util.insertHtml(id, value);
		KE.layout.hide(id);
		KE.util.focus(id);
	}
};

KE.plugin.tapetype = {
		click : function(id) {
			var charTable = [
				['日东','NITTO','3M','德莎','TESA'],
				['索尼','SONY','四维','亚化','寺岗'],
				['东芝']
			];
			var cmd = 'tapetype';
			KE.util.selection(id);
			var table = KE.$$('table');
			table.cellPadding = 0;
			table.cellSpacing = 2;
			table.border = 0;
			table.style.margin = 0;
			table.style.padding = 0;
			table.style.borderCollapse = 'separate';
			table.style.borderSpacing = '2px';
			for (var i = 0; i < charTable.length; i++) {
				var row = table.insertRow(i);
				for (var j = 0; j < charTable[i].length; j++) {
					var cell = row.insertCell(j);
					cell.style.padding = '1px';
					cell.style.margin = 0;
					cell.style.border = '1px solid #AAAAAA';
					cell.style.fontSize = '12px';
					cell.style.cursor = 'pointer';
					cell.onmouseover = function() {this.style.borderColor = '#000000'; }
					cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
					cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
					cell.innerHTML = charTable[i][j];
				}
			}
			var menu = new KE.menu({
				id : id,
				cmd : cmd
			});
			menu.append(table);
			menu.show();
		},
		exec : function(id, value) {
			KE.util.select(id);
			KE.util.insertHtml(id, value);
			KE.layout.hide(id);
			KE.util.focus(id);
		}
	};

KE.plugin.tapesize = {
		click : function(id) {
			var charTable = [
				['mil','mm','cm','m']
			];
			var cmd = 'tapesize';
			KE.util.selection(id);
			var table = KE.$$('table');
			table.cellPadding = 0;
			table.cellSpacing = 2;
			table.border = 0;
			table.style.margin = 0;
			table.style.padding = 0;
			table.style.borderCollapse = 'separate';
			table.style.borderSpacing = '2px';
			for (var i = 0; i < charTable.length; i++) {
				var row = table.insertRow(i);
				for (var j = 0; j < charTable[i].length; j++) {
					var cell = row.insertCell(j);
					cell.style.padding = '1px';
					cell.style.margin = 0;
					cell.style.border = '1px solid #AAAAAA';
					cell.style.fontSize = '12px';
					cell.style.cursor = 'pointer';
					cell.onmouseover = function() {this.style.borderColor = '#000000'; }
					cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
					cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
					cell.innerHTML = charTable[i][j];
				}
			}
			var menu = new KE.menu({
				id : id,
				cmd : cmd
			});
			menu.append(table);
			menu.show();
		},
		exec : function(id, value) {
			KE.util.select(id);
			KE.util.insertHtml(id, value);
			KE.layout.hide(id);
			KE.util.focus(id);
		}
	};

KE.plugin.tapecolor = {
		click : function(id) {
			var charTable = [
				['黑色','白色','红色','橙色'],
				['黄色','绿色','青色','蓝色'],
				['紫色','灰色','褐色','棕色']
			];
			var cmd = 'tapecolor';
			KE.util.selection(id);
			var table = KE.$$('table');
			table.cellPadding = 0;
			table.cellSpacing = 2;
			table.border = 0;
			table.style.margin = 0;
			table.style.padding = 0;
			table.style.borderCollapse = 'separate';
			table.style.borderSpacing = '2px';
			for (var i = 0; i < charTable.length; i++) {
				var row = table.insertRow(i);
				for (var j = 0; j < charTable[i].length; j++) {
					var cell = row.insertCell(j);
					cell.style.padding = '1px';
					cell.style.margin = 0;
					cell.style.border = '1px solid #AAAAAA';
					cell.style.fontSize = '12px';
					cell.style.cursor = 'pointer';
					cell.onmouseover = function() {this.style.borderColor = '#000000'; }
					cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
					cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
					cell.innerHTML = charTable[i][j];
				}
			}
			var menu = new KE.menu({
				id : id,
				cmd : cmd
			});
			menu.append(table);
			menu.show();
		},
		exec : function(id, value) {
			KE.util.select(id);
			KE.util.insertHtml(id, value);
			KE.layout.hide(id);
			KE.util.focus(id);
		}
	};

KE.plugin.tapeunit = {
		click : function(id) {
			var charTable = [
				['卷','支','片','张']
			];
			var cmd = 'tapeunit';
			KE.util.selection(id);
			var table = KE.$$('table');
			table.cellPadding = 0;
			table.cellSpacing = 2;
			table.border = 0;
			table.style.margin = 0;
			table.style.padding = 0;
			table.style.borderCollapse = 'separate';
			table.style.borderSpacing = '2px';
			for (var i = 0; i < charTable.length; i++) {
				var row = table.insertRow(i);
				for (var j = 0; j < charTable[i].length; j++) {
					var cell = row.insertCell(j);
					cell.style.padding = '1px';
					cell.style.margin = 0;
					cell.style.border = '1px solid #AAAAAA';
					cell.style.fontSize = '12px';
					cell.style.cursor = 'pointer';
					cell.onmouseover = function() {this.style.borderColor = '#000000'; }
					cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
					cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
					cell.innerHTML = charTable[i][j];
				}
			}
			var menu = new KE.menu({
				id : id,
				cmd : cmd
			});
			menu.append(table);
			menu.show();
		},
		exec : function(id, value) {
			KE.util.select(id);
			KE.util.insertHtml(id, value);
			KE.layout.hide(id);
			KE.util.focus(id);
		}
	};

KE.plugin.tapeprice = {
		click : function(id) {
			var charTable = [
				['RMB','人民币','￥'],
				['US$','美元','HK$','港币'],
				['元/卷','元/支','元/片','元/张']
			];
			var cmd = 'tapeprice';
			KE.util.selection(id);
			var table = KE.$$('table');
			table.cellPadding = 0;
			table.cellSpacing = 2;
			table.border = 0;
			table.style.margin = 0;
			table.style.padding = 0;
			table.style.borderCollapse = 'separate';
			table.style.borderSpacing = '2px';
			for (var i = 0; i < charTable.length; i++) {
				var row = table.insertRow(i);
				for (var j = 0; j < charTable[i].length; j++) {
					var cell = row.insertCell(j);
					cell.style.padding = '1px';
					cell.style.margin = 0;
					cell.style.border = '1px solid #AAAAAA';
					cell.style.fontSize = '12px';
					cell.style.cursor = 'pointer';
					cell.onmouseover = function() {this.style.borderColor = '#000000'; }
					cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
					cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
					cell.innerHTML = charTable[i][j];
				}
			}
			var menu = new KE.menu({
				id : id,
				cmd : cmd
			});
			menu.append(table);
			menu.show();
		},
		exec : function(id, value) {
			KE.util.select(id);
			KE.util.insertHtml(id, value);
			KE.layout.hide(id);
			KE.util.focus(id);
		}
	};

KE.plugin.tapeinvoice = {
		click : function(id) {
			var charTable = [
				['17％增值税','6％增值税','4％增值税'],
				['普通销售发票','不含税','3％增值税']
			];
			var cmd = 'tapeinvoice';
			KE.util.selection(id);
			var table = KE.$$('table');
			table.cellPadding = 0;
			table.cellSpacing = 2;
			table.border = 0;
			table.style.margin = 0;
			table.style.padding = 0;
			table.style.borderCollapse = 'separate';
			table.style.borderSpacing = '2px';
			for (var i = 0; i < charTable.length; i++) {
				var row = table.insertRow(i);
				for (var j = 0; j < charTable[i].length; j++) {
					var cell = row.insertCell(j);
					cell.style.padding = '1px';
					cell.style.margin = 0;
					cell.style.border = '1px solid #AAAAAA';
					cell.style.fontSize = '12px';
					cell.style.cursor = 'pointer';
					cell.onmouseover = function() {this.style.borderColor = '#000000'; }
					cell.onmouseout = function() {this.style.borderColor = '#AAAAAA'; }
					cell.onclick = new Function('KE.plugin["' + cmd + '"].exec("' + id + '", "' + charTable[i][j] + '")');
					cell.innerHTML = charTable[i][j];
				}
			}
			var menu = new KE.menu({
				id : id,
				cmd : cmd
			});
			menu.append(table);
			menu.show();
		},
		exec : function(id, value) {
			KE.util.select(id);
			KE.util.insertHtml(id, value);
			KE.layout.hide(id);
			KE.util.focus(id);
		}
	};