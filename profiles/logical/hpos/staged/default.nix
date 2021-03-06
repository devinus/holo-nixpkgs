{ config, lib, pkgs, ... }:

with pkgs;

{
  imports = [ ../. ];

  users.users.root.openssh.authorizedKeys.keys = lib.mkForce [
    # Matthew Brisebois
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGakK6G+lvSpg3NKfuWNopUlI/Z2keLGBH09jeAVbslO"
    # Paul B Hartzog
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8w0/vpNXIRB/VPAnbE6RFWoL5DOlZ5x1KmCockehiE"
    # PJ Klimek
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwtG0yk6e0szjxk3LgtWnunOvoXUJIncQjzX5zDiKxY"
    # Perry Kundert
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILYMeKuFegEeM6L7/pJLSxgpyfrXXFOR1H/5C8liZWOL"
    # Sam Rose
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZjtunUHW+Zd7UEzWQ2myqjgmIDTU+lo9lqhkhKW9LGY8yjcdhlgHwhmYUEWkmLbwrQz7vGzACFkhJ4R/2FHPleja+xrWebABWoabcPtFUrGUtSYZM0Ui2VYzhKX7Rxd4qbbF9bejdYeUMSox8RVuBlToyHC1+UgIpkfjm2Y7MTh46ILzpavWvSaHAhvcQi1qQ7kUaVGSdi3+wouMC8R6cjGo/7rCuobIH8cEA+L2IlMox8QE7gnBlP1YvFLSKGn65Jk1490uP7ZRpDphu8yy0mG4K4VjJ48k75L9gZPrFlF/1nRGELUBRdYAdoushYCMP/Kmg1yKsvRJt3UeOkbphiQLUNO3w2qSNiz+RMzM3HCtz2quENyD7UVVyF8kt5z5TMYjj847xCRJKUoDCzGAMCKm1hzrDMGARgpJDPNWSlXC+Hz3/LCwVZXiJy7xunAjJfRv/o4Oo3wbPm7u/AAP6+bIHsji9Nl4y3NuYJHZfs9DHTPONjyEorqLGfLqqzcD93OVo/f6tCMSC5gDyeLUT2/8UXTkMijPNOIJGnfLo6MjU1uGkhN64P1imm57qDILbpG71IJZZf7kX3K0EKPb82i5q5LYepLuWeYqmy+bOqyLBN1v8kFD/Pps4x7nCa4dviH4sy+lJslJizZP9ZFKg4jCVOfCK1zhycofYgKqlKQ=="
    # Yegor Timoshenko
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHLGgzH3ROvo65cnvkXmuz7Qc9bPvU+L2SrafQh0bMrK"
    # Joel Ulahanna
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1smdy0NKOaUaNx0ASklOt+pP7+UZrOrZmz+Uv7iLoVz6OGbTANBCPydSYr9NvoHeTljSd8Ma7Gvk/V0qf3VrxJn3YfC45IIRAdh8mqnGzXKA0YM+WpyUVOwYRYSzL/5HqUsNXaQvSwNZ/Sa8gGCHwysIfsoZP4ABui6HmGAOxD+8tqeEjUqD3jEyyjhPbkw/tL2RCIl2oJVi4Mrm91cIHTXcv1uNSGt/16vbQ3lroXZN+rzPA+nZkEfaw+xpgpW7QQvTaWecwyYqSH/D4scqjF9wBzLRS6fKlde6CKTZ3t6VMKJ0nQVtC1k5VAYlaBPGgDFMbDnCPXnjjCz74YYnsyxCKbpdJxf4Nwt6jL0CD5p5ipvT7l7V1h2z+s4ib6lmaIxE37fLKAMLgFRwmaW3olUWQ3jGlmSbMqbZI9EXvXNdeiYORaJy/FOUOX56ZKRF5imWY2ePrd39el4D3MfTconUhJVuO7p15A/Y8LzLP9dbsKddAOxlEFhYdnac9UkizMNzjWyMOFT0WebnoMhpi0DxKZJz7r2OeuYQlhl+ppo96RjAfDo6q2NsJIeIvLedKt0Qy8hJZco9tRG/sQ3lSa2c23qVUhiZl+KkheLcBGdOjCGJjhPyLr4rT/uefFaW7Ln88rlnwFZF0yxutKMzK+wxaZ+S+mt+H8GW31fnKkQ== joelulahanna@gmail.com"
    # Robbie Carlton
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyiT47/O17wY8G97PqrH/prRQu+vOik0jWlozQuNeJJDE68IwfrNOwnAEfkfMdEjY+Ml0QqiJof4jt1n9O5fVwk+XvtD8zohAzw4DBfwIYZWWZ3sZy96rH/dQNCmXsOE/m8hQYWeNTd1gcA1of3gnk3QFXYal/FHq7roHbhCzPMZ8Bo9I6tQMMZVJdEPSqGGZzL7TTE1NtcFhEInR6p7gqWxSG+toL/Ev/+XUBkjQR2Vz8mCIR4bB53xlSGB/lbp33F36Xn41Ud7y+/4d+58J8Gu047Phr4inOGZs3e4gew96HCtojxGlUfVfoo8ZBwqH3dm8xVkSARjcdXcUo8+PQ7zkEESLbeOG8JQyfBf5+UXv7RFkQM1td7g0T0jmHrJDhGrES3k948Thm+tHTZdIag7n5+zgfjEemVstvk5MMq1W7gax7r4TUORg+TnxseiMCnYCXV30TgzcwK/vUKpFDN/IlSlCUmLnzL4qWE5cAeWZbS4IV3NB2fSQYhjvfMRfXqxSk44RmbvrHu9ixs/QUeb4FRZcjgcU7gG9evbAILUG4QVCk5tA76djhKAbSIrk674Q2wHDZfql9JdcDT2Hw0b7zsgune5t7fzHwA+FoFWWThGLKgCsZOyJxQINi7tR3qlm0yOp6TMeX/TJf3W9dAPuMMqYevPnGoWbzPaXSUQ== robbie.carlton@gmail.com"
    # Lisa Jetton
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDi3LUUol3zA2cqvJr8fYu7OucUHLqEDpINl9OLOVKtTcGFMzwgFgRqhU8pb7VuqX8/92SZ+Ai4P1qM2uDjHDJ9rF4iNMktQulgINztON3UwtjH+4pfE+/+IzSsWq/Tv8ZErwdwXUsowUbpAoXS7An6zr/1koXTNpXLByIO35EaPuIOa29jAPTCXhK8RnXTyhTp+yMRTMaDyVXEDKAt25STJzjop0BVNNdw4fsd1DvpBhsBbd3e1Gx9nuih2TU0keYUjQ6FNm8toMnRI1Kst1yrmLOFh4HjHKNub4Zt/mxS4SWaInBo2Z9G9VNhpjKu57iN+k+LemQxG/hWsT8LAyppBFhCRAzUONAImyAOpdLnnavWQKJt3pziuVfTtzflvUgYDW07cpxOIxCH6I3PFLTpTCpqnAgX0KaCmT9G4Ado1Mk2CDaZPx6uuCJA/e3aTBlh592tByYzdxPzBzx7vb/jf9yu4a5zouMMBoqtgMTxLYM+Q+xRR4thMUGATwY0XeG4DnCXUUM9qCgMfXq/SnktcGa2o1fsu3PZSrCz9VkLhKpYpC/xzXytKYzOuDGJLz75gqKfCIoVcHg9FaQmV5hDOCfmiiCEJRx/Q/gMdfcLxEavl+A/GgiKLts0ezC+KupmR4p+08Tfh9A14rF/aosLmZpXjcptZPpbxXfsqqDq+w== lisa.jetton@holo.host"
  ];
}
