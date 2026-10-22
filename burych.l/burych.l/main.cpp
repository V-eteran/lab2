#include &lt;iostream&gt;
#include &lt;ctime&gt;
#include &lt;cstdlib&gt;
using namespace std;
int main() {
srand((unsigned)time(nullptr));
const int N = 200000;
int* arr1 = new int[N];
int* arr2 = new int[N];
int count = 0;
for (int i = 0; i &lt; N; i++) {
arr1[i] = rand() % 66;
}
clock_t start = clock();
for (int i = 0; i &lt; N; i++) {
if (arr1[i] % 5 == 0) {
arr2[count] = arr1[i];
count++;
}
}
clock_t end = clock();
double seconds = (double)(end - start) / CLOCKS_PER_SEC;
cout &lt;&lt; &quot;First 30 elements of original array:&quot; &lt;&lt; endl;
for (int i = 0; i &lt; 30; i++) {
cout &lt;&lt; arr1[i] &lt;&lt; &quot; &quot;;
}
cout &lt;&lt; endl &lt;&lt; endl;
cout &lt;&lt; &quot;First 30 elements of formed array (multiples of 5):&quot; &lt;&lt; endl;
for (int i = 0; i &lt; 30 &amp;&amp; i &lt; count; i++) {
cout &lt;&lt; arr2[i] &lt;&lt; &quot; &quot;;
}
cout &lt;&lt; endl &lt;&lt; endl;
cout &lt;&lt; &quot;Total elements divisible by 5: &quot; &lt;&lt; count &lt;&lt; endl;
cout &lt;&lt; &quot;Execution time: &quot; &lt;&lt; seconds &lt;&lt; &quot; sec&quot; &lt;&lt; endl;
time_t now = time(nullptr);
tm tinfo;
localtime_s(&amp;tinfo, &amp;now);
char buffer[80];
strftime(buffer, sizeof(buffer), &quot;%d.%m.%Y %H:%M:%S&quot;, &amp;tinfo);
cout &lt;&lt; &quot;Current date and time: &quot; &lt;&lt; buffer &lt;&lt; endl;
delete[] arr1;
delete[] arr2;
system(&quot;pause&quot;);
return 0;
}
