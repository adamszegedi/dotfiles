{ programs, ... }:
{
    programs.mpv = {
        enable = true;
        config = {
            volume = 60;
            hwdec = "auto";
            gpu-api = "vulkan";
            alang = "eng,en,";
            slang = "enm,english,en,eng,enUS";
            audio-stream-silence="yes";
            embeddedfonts=true;
            sub-font-size=46;
            sub-ass-override="yes";
            sub-blur=0.3;
            sub-back-color="0.13/0.12/0.12/0.2";
            sub-color="1.0/1.0/0.0/1.0";
            sub-border-color="0.0/0.0/0.0/0.8";
            sub-border-size="3.2";
            sub-margin-x="100";
            sub-margin-y="50";
            sub-shadow-color="0.0/0.0/0.0/0.25";
            sub-shadow-offset=4;
        };
    };
}
