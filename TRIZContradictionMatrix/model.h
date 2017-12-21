#pragma once
#include <QObject>
#include <QMap>
#include <QList>

class Concept : public QObject {
	Q_OBJECT
		Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
		Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
		Q_PROPERTY(QString desc1 READ desc1 WRITE setDesc1 NOTIFY desc1Changed)
		Q_PROPERTY(QString desc2 READ desc2 WRITE setDesc2 NOTIFY desc2Changed)
		Q_PROPERTY(QString desc3 READ desc3 WRITE setDesc3 NOTIFY desc3Changed)
		Q_PROPERTY(QString desc4 READ desc4 WRITE setDesc4 NOTIFY desc4Changed)
		Q_PROPERTY(QMap<int, int> extractedConcept READ extractedConcept WRITE setExtractedConcept NOTIFY extractedConceptChanged)
public:
	Concept(QObject* parent=0) : QObject(parent) { }
	/*Explorer(int id, QString name, QString path) : m_id(id), m_name(name), m_path(path) { }
	Explorer(int id, QString name, QString path, bool extended) : m_id(id), m_name(name), m_path(path), m_extended(extended) { }
	Explorer(
		int id,
		int parent,
		QString name,
		QString path,
		QList<QObject*> children) : m_id(id), m_parent(parent), m_name(name), m_path(path), m_children(children) { 	}
	Explorer(
		int id,
		int parent,
		QString name,
		QString path,
		bool extended,
		QList<QObject*> children) : m_id(id), m_parent(parent), m_name(name), m_path(path), m_extended(extended), m_children(children) { 	}*/
	Concept(int id, QString name, QString desc1 = "", QString desc2 = "", QString desc3 = "", QString desc4 = "")
		: m_id(id), m_name(name), m_desc1(desc1), m_desc2(desc2), m_desc3(desc3), m_desc4(desc4) { }
	Concept(QString name, QString desc1 = "", QString desc2 = "", QString desc3 = "", QString desc4 = "")
		: m_name(name), m_desc1(desc1), m_desc2(desc2), m_desc3(desc3), m_desc4(desc4) { }

	Q_INVOKABLE int id() const { return m_id; }	
	Q_INVOKABLE QString name() const { return m_name; }
	Q_INVOKABLE QString desc1() const { return m_desc1; }
	Q_INVOKABLE QString desc2() const { return m_desc2; }
	Q_INVOKABLE QString desc3() const { return m_desc3; }
	Q_INVOKABLE QString desc4() const { return m_desc4; }
	Q_INVOKABLE QMap<int, int> extractedConcept() { return m_extractedConcept; }	/* 1 : int, engineering varialbes number, 2 : invention concept number  */

	public slots:
	void setId(const int id) { m_id = id; }	
	void setName(const QString &m) { m_name = m; emit nameChanged(); }
	void setDesc1(const QString &m) { m_desc1 = m; emit desc1Changed(); }
	void setDesc2(const QString &m) { m_desc2 = m; emit desc2Changed(); }
	void setDesc3(const QString &m) { m_desc3 = m; emit desc3Changed(); }
	void setDesc4(const QString &m) { m_desc4 = m; emit desc4Changed(); }
	void setExtractedConcept(const QMap<int, int> &m) { m_extractedConcept = m; emit extractedConceptChanged(); }	

signals:
	void idChanged();
	void nameChanged();
	void desc1Changed();
	void desc2Changed();
	void desc3Changed();
	void desc4Changed();
	void extractedConceptChanged();

private:
	int m_id = -1;
	QString m_name;
	QString m_desc1;
	QString m_desc2;
	QString m_desc3;
	QString m_desc4;
	QMap<int, int> m_extractedConcept;
};
//Q_DECLARE_METATYPE(Concept*)



class Model : public QObject
{
	Q_OBJECT
		Q_PROPERTY(QList<QObject*> eng READ eng WRITE setEng NOTIFY engChanged)
		Q_PROPERTY(QList<Concept*> inv READ inv WRITE setInv NOTIFY invChanged)
		Q_PROPERTY(QList<QString> list READ list WRITE setList NOTIFY listChanged)
public:
	Model()
	{
		m_eng.append(new Concept("움직이는 물체의 무게", "중력장에서의 물체의 질량. 물체의 몸체가 지지체나 버팀목에 가하는 힘"));
		m_eng.append(new Concept("고정된 물체의 무게", "중력장에서의 물체의 질량 (물체의 몸체가 지지체나 버팀목, 혹은 물체가 위치한 표면에 가하는 힘)"));
		m_eng.append(new Concept("움직이는 물체의 길이", "물체의 양 끝 사이의 거리 (넓은 의미에서 물체와 다른 대상간의 거리도 해당함)"));
		m_eng.append(new Concept("고정된 물체의 길이", "물체의 양 끝 사이의 거리 (넓은 의미에서 물체와 다른 대상간의 거리도 해당함)"));
		m_eng.append(new Concept("움직이는 물체의 면적", "물체 표면의 크기 (물체 표면의 일부 혹은 물체의 내부나 외부 표면의 크기를 의미함)"));
		m_eng.append(new Concept("고정된 물체의 면적", "물체 표면의 크기 (물체 표면의 일부 혹은 물체의 내부나 외부 표면의 크기를 의미함)"));
		m_eng.append(new Concept("움직이는 물체의 부피", "물체가 차지하는 3차원 공간 (직육면체의 부피=길이x폭x높이, 원통의 부피=밑면적x높이)"));
		m_eng.append(new Concept("고정된 물체의 부피", "물체가 차지하는 3차원 공간 (직육면체의 부피=길이x폭x높이, 원통의 부피=밑면적x높이)"));
		m_eng.append(new Concept("속도", "물체의 움직임의 비율 또는 위치를 바꾸는 비율 (물체가 단위 시간당 움직인 거리, 초당 회전수, 단위시간 당 공정(프로세스)이나 동작의 양 등으로 표현됨) "));
		m_eng.append(new Concept("힘(force)", "시스템들 간의 상호작용 (뉴튼물리학에서 힘=질량x가속도로 구하지만, 트리즈에서 힘은 물체의 조건을 변화시키기 위한 어떤 상호작용을 힘으로 봄. 예: 회전력)"));
		m_eng.append(new Concept("압력(응력)", "물체의 단위 면적 당 가해진 힘 (응력은 물체가 외부에서 가해지는 힘에 저항해서 본래 모양을 유지시키려는 힘으로, 압력에 대한 물체의 내부적 저항을 의미함)"));
		m_eng.append(new Concept("모양(형상)", "물체의 겉모습 또는 외부적 윤곽 (색깔과 내용물, 구성 물질, 위치, 방향, 크기 등의 특성을 포함함)"));
		m_eng.append(new Concept("구성요소의 안정성", "시스템을 구성하는 요소들 간의 정밀한 결합 정도 (마모나 화학적 분리, 분해 등은 모두 안정성을 감소시킴)"));
		m_eng.append(new Concept("강도(strength)", "파괴에 저항하는 힘 (물체가 변하지 않기 위해서 압력 또는 응력에 저항하는 힘)"));
		m_eng.append(new Concept("움직이는 물체의 내구성 (작동 지속시간)", "시스템이 고장이 나지 않고 작동할 수 있는 시간 (내구력)"));
		m_eng.append(new Concept("고정된 물체의  내구성 (작동 지속시간)", "시스템이 고장이 나지 않고 작동할 수 있는 시간 (내구력)"));
		m_eng.append(new Concept("온도", "물체가 차거나 뜨거운 정도 (과학적 의미에서 온도는 분자 운동과 에너지 흐름의 지표이므로, 온도의 변화율에 영향을 미치는 열용량과 같은 온도 파라미터도 해당됨)"));
		m_eng.append(new Concept("조도(밝기) ", "빛의 밝기를 나타내는 정도  (단위 면적 당 빛의 유량이나 휘도, 빛의 품질 등과 같은 빛의 특성을 포함함)"));
		m_eng.append(new Concept("움직이는 물체의 에너지 사용량", "특정한 작업을 수행하기 위해서 요구되는 에너지 (고전기계학에서는 에너지=힘x거리이지만, 트리즈에서는 전기와 같은 슈퍼시스템에 의해 제공되는 에너지의 사용량도 포함하며, 시스템이 소비한 에너지인 흡수동력을 의미함)"));
		m_eng.append(new Concept("고정된 물체의 에너지 사용량", "특정한 작업을 수행하기 위해서 요구되는 에너지 (고전기계학에서는 에너지=힘x거리이지만, 트리즈에서는 전기와 같은 슈퍼시스템에 의해 제공되는 에너지의 사용량도 포함하며, 시스템이 소비한 에너지인 흡수동력을 의미함)"));
		m_eng.append(new Concept("동력(power)", "작업이 수행되는 동안 시스템이 발생한 에너지 (흡수동력이 아닌 발생동력을 의미하며, 물리학에서는 전력, 수력, 풍력 등의 에너지를 원동기에 의해 기계적 에너지로 변환해서 일으킨 힘을 의미함)"));
		m_eng.append(new Concept("에너지 손실", "작업이 완료되는데 기여하지 못한 채 낭비된 에너지 (에너지 손실을 줄이기 위해서는 에너지 사용량(19번, 20번)을 개선하는 기술과는 다른 기술을 요구하므로 다른 공학변수로 분리함)"));
		m_eng.append(new Concept("물질의 손실", "시스템의 재료, 물질, 부품, 혹은 하위시스템의 부분적, 완전한, 영구적 혹은 잠정적인 손실"));
		m_eng.append(new Concept("정보의 손실", "시스템 내의 혹은 시스템에 의한 정보의 부분적, 완전한, 영구적  혹은 잠정적인 손실 (아로마, 감촉 등과 같은 감각적 데이터의 손실도 포함함)"));
		m_eng.append(new Concept("시간 낭비", "어떤 활동이 진행되어야 하는 시간과 실제로 진행되는 시간 간의 차이 (하나의 활동이 진행되는 기간을 시간으로 보면, 시간 낭비를 개선한다는 것은 작동을 위해 소요되는 시간을 줄인다는 것을 의미하며, “사이클 타임 감소”가 일반적으로 사용되는 용어임)"));
		m_eng.append(new Concept("물질의 양", "완전히, 부분적으로, 영구적 혹은 잠정적으로 변화될 수 있는 시스템의 하위시스템(재료, 부품)의 총량"));
		m_eng.append(new Concept("신뢰성", "시스템이 일반적인 상태에서 뿐만 아니라 예측할 수 없는 상황이나 조건에서도 시스템의 기능을 수행하고 유지하는 능력"));
		m_eng.append(new Concept("측정의 정확성", "시스템의 특성의 측정된 값이 실제 값에 얼마나 근접한가의 정도  (측정 오류를 줄이는 것이 측정의 정확성을 높이는 방법임)"));
		m_eng.append(new Concept("제조의 정밀성", "시스템이나 물체의 실제 특성 값이 특정되거나 요구된 특성 값과 일치하는 정도"));
		m_eng.append(new Concept("외부로부터 영향을 받는 부작용", "외부적으로 생성된 유해한 인자에 대한 시스템의 민감성"));
		m_eng.append(new Concept("대상물이 생성한 부작용", "물체나 시스템의 작업의 일부로 나타나는 유해한 인자 (물체나 시스템이 외부 환경에 유해한 영향을 초래하는 작용을 생성하는 것)"));
		m_eng.append(new Concept("제조의 용이성", "물체나 시스템을 제조 또는 조립하는데 있어 얼마나 쉽고, 편안하고, 노력이 덜 들어가는지의 정도"));
		m_eng.append(new Concept("사용의 용이성 ", "작업이나 사용의 단순한 정도 (많은 사람이나 여러 작업 단계, 특별한 도구 등이 요구되지 않아야 용이한 것임)"));
		m_eng.append(new Concept("수리의 용이성", "시스템의 결점이나 고장, 불량을 수리하는 시간이나 방법 등이 단순한 정도  "));
		m_eng.append(new Concept("적응력(적응성)", "시스템이나 물체가 외부 변화에 긍정적으로 반응하는 정도 (물체나 시스템을 다양한 환경에서 여러 가지 방법으로 사용될 수 있으면 적응력이 좋은 것임)"));
		m_eng.append(new Concept("장치의 복잡성", "시스템을 구성하는 요소의 수와 다양성, 시스템 구성 요소 간의 상호작용 정도 (구성 요소 수와 다양성, 구성 요소 간의 상호작용이 많을수록 복잡한 것임)"));
		m_eng.append(new Concept("제어와 측정의 난이도", "제어와 측정에 요구되는 장치나 시간, 비용, 노동력 등의 정도  (허용 가능한 오차를 만족시키기 위해 측정비용이 증가하는 것도 측정의 난이도가 증가한 것으로 봄)"));
		m_eng.append(new Concept("자동화의 정도", "사람의 개입 없이 시스템이나 물체가 그 기능을 수행하는 정도 (자동화의 정도가 가장 낮은 수준은 손으로 작동하는 도구를 사용하는 것이고, 가장 높은 수준은 기계가 필요한 작업이 무엇인지 인지하고 스스로 작업하고 모니터링까지 하는 것임)"));
		m_eng.append(new Concept("생산성", "단위 시간 당 시스템에 의해 수행된 기능이나 작업의 수 "));

		m_list.append("QWEQWEQWE111");
		m_list.append("QWEQWEQWE");
		m_list.append("QWEQWEQWE");
		m_list.append("QWEQWEQWE");
		m_list.append("QWEQWEQWE");

		for (int i = 0; i < m_eng.length(); i++)
			qobject_cast<Concept*>(m_eng[i])->setId(i);

	}

	Q_INVOKABLE QList<QObject*> eng() const { return m_eng; }
	Q_INVOKABLE QList<Concept*> inv() const { return m_inv; }
	Q_INVOKABLE QList<QString> list() const { return m_list; }
	Q_INVOKABLE QString getTest() const { return "TEST"; }

	public slots :
		void setEng(const QList<QObject*> m) { m_eng = m; emit engChanged(); }
		void setInv(const QList<Concept*> m) { m_inv = m; emit invChanged(); }
		void setList(const QList<QString> m) { m_list = m; emit listChanged(); }

		signals :
		void engChanged();
		void invChanged();
		void listChanged();

private:
	QList<QObject*> m_eng;
	QList<Concept*> m_inv;
	QList<QString> m_list;
};
