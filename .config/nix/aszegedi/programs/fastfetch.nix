{
  logo = {
    padding = {
      right = 2;
      left = 2;
      top = 2;
    };
  };
  display = {
        separator = " ➜  ";
  };
  modules = [
      "break"
      "break"
      {
          type = "custom";
          format = "┌ Os ────────────────────────────────────────────────────────┐";
      }
      {
          type = "os";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "kernel";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "packages";
          key = "   󰏖 ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "command";
          key = "   OS Age ";
          keyColor = "cyan";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
      }
      {
          type = "uptime";
          key = "   Uptime ";
          keyColor = "cyan";
      }
      {
          type = "custom";
          format = "└────────────────────────────────────────────────────────────┘";
      }
      "break"
      {
          type = "custom";
          format = "┌ Desktop ───────────────────────────────────────────────────┐";
      }
      {
          type = "shell";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "wm";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "wmtheme";
          key = "   󰉼 ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
         type = "icons";
         key = "    󰀻 ";
         keyColor = "cyan";
         outputColor = "default";
      }
      {
          type = "cursor";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "terminal";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "terminalfont";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "custom";
          format = "└────────────────────────────────────────────────────────────┘";
      }
      "break"
      {
          type = "custom";
          format = "┌ Hardware ──────────────────────────────────────────────────┐";
      }
      {
          type = "board";
          format = "{2} {1}";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "gpu";
          format = "{1} {2} @ {12} GHz";            
          key = "   󰢮 ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "memory";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "disk";
          key = "   󰋊 ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "monitor";
          key = "    ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "swap";
          key = "   󰓡 ";
          keyColor = "cyan";
          outputColor = "default";
      }
      {
          type = "custom";
          format = "└────────────────────────────────────────────────────────────┘";
      }
      "break"
      "break"
  ];
}
