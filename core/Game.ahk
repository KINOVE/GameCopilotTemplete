#Include ini.ahk
class Game {
    static game_name := Settings.getIni("global","game_name")
    static game_size := {
        width : 0,
        height : 0
    }

    ; 获取游戏的分辨率
    static get_game_pos() {
        if (this.is_game_window_exist()) {
            WinGetClientPos(, , &width, &height, 'ahk_exe ' this.game_name)
        } else {
            this.game_size.width := 0
            this.game_size.height := 0
            return [this.game_size.width, this.game_size.height]
        }
        this.game_size.width := width
        this.game_size.height := height
        return [this.game_size.width, this.game_size.height]
    }

    ; 游戏进程是否存在
    static is_game_process_exist() {
        return ProcessExist(this.game_name)
    }

    ; 游戏窗口是否存在
    static is_game_window_exist() {
        return WinExist('ahk_exe ' this.game_name)
    }

    ; 游戏窗口是否激活
    static is_game_active(){
        return WinActive('ahk_exe ' this.game_name)
    }

    ; 关闭游戏和脚本程序
    static close_game(){
        if WinExist('ahk_exe ' this.game_name)
            WinClose
        ExitApp
    }
}