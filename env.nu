if not ($".env" | path exists) {
    cp .env.tmpl .env
    print "已创建 .env，内容如下："
    open .env
} else {
    print ".env 已存在，跳过创建。"
}
