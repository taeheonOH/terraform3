resource "aws_key_pair" "thoh_key" {
  key_name = "thoh-key"
  public_key = file("../../.ssh/thoh-key.pub")
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtl7tudpN390UCFK5YPGazSerx31UgRcwGW05K85+UzLdmEzS+LPh18J1ySb0iTsn0czjoJcvlf5tXsTVLR6o3yupQYwiwfv4oKcDuv7X3cTSLED3x+u2boXC1QXVQDg8m9S7WGMReElnJ3k2kFCYHtHE9An1HcHq/kFw4PgsArDOrWQ3nLBfJZahir03BMpwrP7obFYjFeSwReJn05oZw/LbBTsjYgaA29vkoXNecwVj52BCpk0N4R7zoEUSO2rwwk/CQC69vqv43Z0PLAMr4GFHe+RTTh+0MUOAgjZo/gzurU3tzXbO12Ez+2T+LTAcQ2ZYQvQY9X79G1I+LZsab8eu2MhNCHXZ4Xw+WMwi4Lw9WzOt/XQulUjcGy+d5OfM08tUNWl7FJdQ2jDuhY5j4kmM4KkBegO7VhR+kGh7c9GOtm9+Z9sCWVxG21ACHUz+wnxsnAl7nL2/e50bajBqL4/EwJgE/wStYAJu0L06635RU+oTbB0pQZ9G7+D1IcCU="   
}