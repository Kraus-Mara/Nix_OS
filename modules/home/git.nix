{ pkgs, username, ... }:
{
  programs.delta = {
    enable = true;
    options = {
      line-numbers = true;
      side-by-side = false;
      diff-so-fancy = true;
      navigate = true;
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Kraus-Mara";
      user.email = "antoinep.kraus@gmail.com";
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      url = {
        "git@github.com:".insteadOf = [
          "gh:"
          "https://github.com/"
        ];
        "git@github.com:kraus-mara/".insteadOf = "fp:";
      };
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };
  };

  home.packages = [ pkgs.gh ]; # pkgs.git-lfs
}
