cd $GOPATH/src \
&& go get -u k8s.io/apimachinery/pkg/apis/meta/v1 \
&& go get -u k8s.io/code-generator/... \
&& cd $GOPATH/src/k8s.io/code-generator \
&& ./generate-groups.sh all \
dudu_controller/pkg/client \
dudu_controller/pkg/apis \
dudu:v1
