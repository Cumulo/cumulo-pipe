
var
  gulp $ require :gulp
  script $ require :gulp-cirru-script

gulp.task :script $ \ ()
  return $ ... gulp
    src :src/*.cirru
    pipe (script)
    pipe $ gulp.dest :lib/
