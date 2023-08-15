Class Color{
    __New(colorId := '') {
        if (colorId == '') { ; 设置没有值传入时的状态
            this.c := '0xffffff'
            return
        }
        this.c := '0x' . StrUpper(SubStr(colorId, 2, 6))
    }
}