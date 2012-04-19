/**
saveOutput
Just a quick and dirty function to save frames
Todo: a better solution
*/

int __currentFrame = 0;
void saveOutput() {
  hint(DISABLE_DEPTH_SORT);
  hint(DISABLE_DEPTH_TEST);
  save("out/" + __currentFrame + ".png");
  hint(ENABLE_DEPTH_SORT);
  hint(ENABLE_DEPTH_TEST);
  __currentFrame++;
}

