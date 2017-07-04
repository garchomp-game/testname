# -*- coding: utf-8 -*-
import xlwt
book = xlwt.Workbook()
book.add_sheet('NewSheet_1')
book.save('sample.xls')
