#include <iostream>
using namespace std;

int okafis;
int n, m, nrelem, ok;
int v[90], contor[31];

void citire()
{
    cin>>n>>m;
    nrelem=3*n;
    for (int i=0; i<nrelem; i++)
    {
        cin>>v[i];
        contor[v[i]]++;
    }
}

void afisare()
{
    for (int i=0; i<nrelem; i++)
        cout<<v[i]<<' ';
    cout<<endl;
}

void back(int k)
{
    if (okafis==1)
        return;
    if (k==nrelem)
    {
        okafis=1;
        afisare();
        return;
    }
    if (v[k]!=0)
    {
        back(k+1);
    }
    else
        for (int i=1; i<=n; i++)
        {
            if (contor[i]!=3)
            {
                ok=1;
                for (int j=1; j<=m; j++)
                {
                    if (k-j >= 0)
                    {
                        if (v[k-j]==i)
                        {
                            ok=0;
                            break;
                        }
                    }
                    if (k+j <= nrelem)
                    {
                        if (v[k+j]==i)
                        {
                            ok=0;
                            break;
                        }
                    }
                }
                if (ok!=0)
                {
                    contor[i]++;
                    v[k]=i;
                    back(k+1);
                    contor[i]--;
                    v[k]=0;
                }
            }
        }
}

int main()
{
    citire();
    back(0);
    if (okafis==0)
        cout<<-1;
    return 0;
}
