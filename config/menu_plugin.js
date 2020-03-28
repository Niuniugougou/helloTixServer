'use strict';

module.exports = {
    menuList: {
        "status": "success",
        "code": 200,
        "children": [{
            "id": "11",
            "parentId": "1",
            "url": "/admin/workbench",
            "name": "工作视图",
            "sequence": 1,
            "icon": "news",
            "children": []
        },
        {
            "id": "12",
            "parentId": "1",
            "url": "application",
            "name": "应用中心",
            "sequence": 2,
            "icon": "sort",
            "children": [{
                "id": "121",
                "parentId": "12",
                "url": "/admin/center",
                "name": "文章中心",
                "sequence": 1,
                "icon": "record",
                "children": [{
                    "id": "43f9ec66f37b4379959c9922c593692a",
                    "parentId": "121",
                    "url": "/admin/markdown",
                    "name": "markDown",
                    "sequence": 1,
                    "icon": "edit",
                    "children": []
                },
                {
                    "id": "1212",
                    "parentId": "121",
                    "url": "/admin/edit",
                    "name": "富文本",
                    "sequence": 1,
                    "icon": "edit",
                    "children": []
                },
                {
                    "id": "1213",
                    "parentId": "121",
                    "url": "/admin/articlemanage",
                    "name": "文章管理",
                    "sequence": 1,
                    "icon": "edit",
                    "children": []
                },
                {
                    "id": "1214",
                    "parentId": "121",
                    "url": "/admin/articletypemanage",
                    "name": "文章类型管理",
                    "sequence": 1,
                    "icon": "edit",
                    "children": []
                }
                ]
            },
            // {
            //     "id": "123",
            //     "parentId": "12",
            //     "url": "/admin/messages",
            //     "name": "消息中心",
            //     "sequence": 3,
            //     "icon": "mail",
            //     "children": []
            // },
            {
                "id": "124",
                "parentId": "12",
                "url": "/admin/banner",
                "name": "首页轮播",
                "sequence": 3,
                "icon": "news",
                "children": []
            }
            ]
        },
        {
            "id": "13",
            "parentId": "1",
            "url": "/admin/user",
            "name": "用户管理",
            "sequence": 3,
            "icon": "group",
            "children": []
        },
        {
            "id": "14",
            "parentId": "1",
            "url": "/admin/custom",
            "name": "自定义功能",
            "sequence": 3,
            "icon": "group",
            "children": [{
                "id": "141",
                "parentId": "14",
                "url": "/admin/vue-cropper",
                "name": "头像裁剪",
                "sequence": 3,
                "icon": "news",
                "children": []
            },
            {
                "id": "142",
                "parentId": "14",
                "url": "/admin/commentsmanage",
                "name": "评论管理",
                "sequence": 4,
                "icon": "news",
                "children": []
            },
            {
                "id": "143",
                "parentId": "14",
                "url": "/admin/crawler",
                "name": "数据爬取",
                "sequence": 5,
                "icon": "news",
                "children": [
                    {
                        "id": "1431",
                        "parentId": "143",
                        "url": "/admin/articleCrawler",
                        "name": "文章类型",
                        "sequence": 1,
                        "icon": "news",
                        "children": []
                    },
                    {
                        "id": "1432",
                        "parentId": "143",
                        "url": "/admin/imgsCrawler",
                        "name": "图片类型",
                        "sequence": 1,
                        "icon": "news",
                        "children": []
                    }
                ]
            }
            ]
        },
        {
            "id": "15",
            "parentId": "1",
            "url": "",
            "name": "有趣的功能",
            "sequence": 1,
            "icon": "group",
            "children": [
                {
                    "id": "151",
                    "parentId": "15",
                    "url": "/admin/progressBar",
                    "name": "不一样的进度条",
                    "sequence": 1,
                    "icon": "news",
                    "children": []
                },
                {
                    "id": "152",
                    "parentId": "15",
                    "url": "/admin/editTable",
                    "name": "可编辑table",
                    "sequence": 2,
                    "icon": "news",
                    "children": []
                },
                {
                    "id": "153",
                    "parentId": "15",
                    "url": "/admin/editTree",
                    "name": "可编辑Tree",
                    "sequence": 3,
                    "icon": "news",
                    "children": []
                },
                {
                    "id": "154",
                    "parentId": "15",
                    "url": "/admin/process",
                    "name": "可拖拽流程图",
                    "sequence": 4,
                    "icon": "news",
                    "children": []
                }
            ]
        },
        ]
    }
}


