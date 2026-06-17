{ mattpocock-skills, pkgs, ... }:

{

  programs.pi.coding-agent = {
    enable = true;

    skills = [
      (mattpocock-skills + "/skills")
    ];

    settings = {
      packages = [
        "npm:@plannotator/pi-extension"
        "npm:@ff-labs/pi-fff"
        "npm:@juicesharp/rpiv-web-tools"
        "npm:@juicesharp/rpiv-ask-user-question"
        "npm:@juicesharp/rpiv-todo"
      ];
    };

    environment = {
      AWS_PROFILE = pkgs.writeText "pi-aws-profile" "bedrock";
    };
  };
}
