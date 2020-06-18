package br.com.app.paulo.desafio.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import java.util.List;

import br.com.app.paulo.desafio.R;
import br.com.app.paulo.desafio.model.Funcionario;

/**
 * Created by pvnluz on 25/04/2017.
 */

public class ListaFuncionarioAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {


    private Context context;
    private LayoutInflater inflater;
    private List<Funcionario> funcionarios;


    public ListaFuncionarioAdapter(Context context, List<Funcionario> funcionarios){

        this.context = context;
        this.inflater = LayoutInflater.from(context);// trocar elementos da lista
        this.funcionarios = funcionarios;

    }


    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View view = inflater.inflate(R.layout.item, parent, false); // pega o layout e faz o inflamento da informação
        return new AndroidItemHolder(view);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {

        AndroidItemHolder androidItemHolder = (AndroidItemHolder)holder;
        androidItemHolder.tvNome.setText(funcionarios.get(position).getNome());
        androidItemHolder.tvSobrenome.setText(funcionarios.get(position).getSobrenome());

        Glide.with(context)
                .load(funcionarios.get(position).getUrlImagem())
                .placeholder(R.mipmap.ic_launcher)// fica a imagem ate baixar a original
                .error(R.mipmap.ic_launcher) //imagem para erro no lugar da original
                .into(androidItemHolder.ivImage);

    }

    @Override
    public int getItemCount() {
        return funcionarios.size();
    }

    private class AndroidItemHolder extends RecyclerView.ViewHolder{

        TextView tvNome, tvSobrenome;
        ImageView ivImage;

        public AndroidItemHolder(View itemView) {
            super(itemView);

            tvNome = (TextView) itemView.findViewById(R.id.tvNome);
            tvSobrenome = (TextView) itemView.findViewById(R.id.tvSobrenome);
            ivImage = (ImageView) itemView.findViewById(R.id.ivImage);

        }
    }
}
