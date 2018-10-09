#!/usr/bin/env python 
# -*- coding: utf-8 -*- 
# @Time : 2018/8/10 下午4:04 
# @Author : North30 
# @Site :  
# @File : road.py 
# @Software: PyCharm

import os
import json
import time
import datetime
import getpass


# 读取文件内容
def readFile(path):
    fp = open(path)
    content = fp.read()
    fp.close()
    return content


# 创建文件
def makeFile(moudel_path_t, moudel_name, class_name, moudel_base_name, target_name):
    if os.path.exists(moudel_path_t) != True: os.mkdir(moudel_path_t)
    class_head_name = '%s.h' % class_name
    class_full_name = '%sObjective-C' % (class_name)

    moudel_head_name = ('%s.h' % moudel_name)
    moudel_source_name = '%s.m' % moudel_name
    moudel_head_path = '%s/%s' % (moudel_path_t, moudel_head_name)
    moudel_source_path = '%s/%s' % (moudel_path_t, moudel_source_name)
    author_name = getpass.getuser()
    #先获得时间数组格式的日期 
    threeDayAgo = datetime.datetime.now()
    #转换为其他字符串格式: 
    create_date = threeDayAgo.strftime("%Y/%m/%d")

    fph = open(moudel_head_path, 'w')
    fps = open(moudel_source_path, 'w')

    class_head_templete_path = './CocoaTouchClass.xctemplate/%s/___FILEBASENAME___.h' % class_full_name
    class_source_templete_path = './CocoaTouchClass.xctemplate/%s/___FILEBASENAME___.m' % class_full_name
    class_head_templete_content = readFile(class_head_templete_path)
    class_source_templete_content = readFile(class_source_templete_path)

    # 头文件模板内容替换
    class_head_templete_content = class_head_templete_content.replace('___FILEHEADER___', moudel_head_name)
    class_head_templete_content = class_head_templete_content.replace('___MOUDELNAME___', moudel_base_name)
    class_head_templete_content = class_head_templete_content.replace('___TARGETNAME__', target_name)
    class_head_templete_content = class_head_templete_content.replace('___AUTHOR___', author_name)
    class_head_templete_content = class_head_templete_content.replace('___CREATEDATE___', create_date)
    class_head_templete_content = class_head_templete_content.replace('___IMPORTHEADER_cocoaTouchSubclass___', ('#import "%s"' % class_head_name))
    class_head_templete_content = class_head_templete_content.replace('___FILEBASENAMEASIDENTIFIER___', moudel_name)
    class_head_templete_content = class_head_templete_content.replace('___VARIABLE_cocoaTouchSubclass___', class_name)

    # 实现文件模板内容替换
    class_source_templete_content = class_source_templete_content.replace('___FILEHEADER___', moudel_head_name)
    class_source_templete_content = class_source_templete_content.replace('___MOUDELNAME___', moudel_base_name)
    class_source_templete_content = class_source_templete_content.replace('___TARGETNAME__', target_name)
    class_source_templete_content = class_source_templete_content.replace('___AUTHOR___', author_name)
    class_source_templete_content = class_source_templete_content.replace('___CREATEDATE___', create_date)
    class_source_templete_content = class_source_templete_content.replace('___FILEBASENAME___', moudel_name)
    class_source_templete_content = class_source_templete_content.replace('___FILEBASENAMEASIDENTIFIER___', moudel_name)

    fph.write(class_head_templete_content)
    fps.write(class_source_templete_content)
    fph.close()
    fps.close()


# 创建模块
def makeMoudel(project_item):
    proj_path = project_item["proj_path"]
    (filepath,filename) = os.path.split(proj_path)
    (target,extension) = os.path.splitext(filename)
    path = os.path.dirname(os.path.abspath(proj_path))
    parent_path = project_item['parent_path']
    moudels = project_item["moudels"]
    for moudel in moudels:
        moudel_name = moudel["moudel_name"]
        moudel_path = '%s/%s/%s/%s' % (path, target, parent_path, moudel_name)

        if os.path.exists(moudel_path) != True: os.makedirs(moudel_path)

        moudel_path_m = ('%s/Model' % moudel_path)
        moudel_path_v = ('%s/View' % moudel_path)
        moudel_path_c = ('%s/Controller' % moudel_path)
        makeFile(moudel_path_m, ('%sViewModel' % moudel_name), 'GCBaseViewModel', moudel_name, target)
        makeFile(moudel_path_v, ('%sView' % moudel_name), 'UIView', moudel_name, target)
        makeFile(moudel_path_c, ('%sVC' % moudel_name), 'GCBaseVC', moudel_name, target)


def creates():
    mfp = open('moudels.json')
    mnames = mfp.read()
    array = json.loads(mnames)
    for dic in array:
        makeMoudel(dic)

if __name__ == '__main__':
    # path = './CocoaTouchClass.xctemplate/GCBaseVCObjective-C/___FILEBASENAME___.h'
    # content = readFile(path)
    # print content

    creates()
    os.system("ruby autor.rb")
