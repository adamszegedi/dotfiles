{ programs, ... }:
{
    programs.swaylock.enable = true;
    programs.swaylock.settings = {
        ignore-empty-password = true;
        indicator-radius=160;
        indicator-thickness=30;
        color="282C34";
        bs-hl-color="abb2bf";
        caps-lock-bs-hl-color="abb2bf";
        caps-lock-key-hl-color="98c379";
        inside-color = "00000000";
        inside-clear-color= "00000000";
        inside-caps-lock-color= "00000000";
        inside-ver-color= "00000000";
        inside-wrong-color= "00000000";
        key-hl-color="98c379";
        layout-bg-color= "00000000";
        layout-border-color= "00000000";
        layout-text-color="56b6c2";
        line-color= "00000000";
        line-clear-color= "00000000";
        line-caps-lock-color= "00000000";
        line-ver-color= "00000000";
        line-wrong-color= "00000000";
        ring-color="c678dd";
        ring-clear-color="abb2bf";
        ring-caps-lock-color="61afef";
        ring-ver-color="e5c07b";
        ring-wrong-color="e06c75";
        separator-color= "00000000";
        text-color="56b6c2";
        text-clear-color="abb2bf";
        text-caps-lock-color="61afef";
        text-ver-color="e5c07b";
        text-wrong-color="e06c75";
    };
}
