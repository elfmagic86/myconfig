
# https://docs.bazel.build/versions/master/install-ubuntu.html#install-with-installer-ubuntu
# 1. jdk
# sudo apt-get install openjdk-8-jdk

# 2. Add Bazel distribution URI as a package source
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

#Step 3: Install and update Bazel
sudo apt-get update && sudo apt-get install bazel
# Once installed, you can upgrade to a newer version of Bazel with the following command:
# sudo apt-get install --only-upgrade bazel
